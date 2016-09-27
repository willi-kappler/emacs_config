(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(package-selected-packages (quote (expand-region iy-go-to-char multiple-cursors)))
 '(show-paren-mode t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/lisp/")

(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(autoload 'toml-mode "toml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.toml\\'" . toml-mode))

(autoload 'cr-basic-mode "cr-basic-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.CR1\\'" . cr-basic-mode))

(load-library "avy")
(require 'avy)

(global-set-key (kbd "C-c j") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

(desktop-save-mode 1)
(setq bookmark-save-flag t)
(global-linum-mode t)

;(load-theme 'manoj-dark)
;(set-background-color "black")
;(set-face-attribute 'default nil :height 180)
;(set-default-font "Monaco 18")


; For MacOS: define super for alt-gr on german PC keyboard
(if (eq system-type 'darwin)
  (define-key global-map [?\s-7] (lambda () (interactive) (insert "{")))
  (define-key global-map [?\s-8] (lambda () (interactive) (insert "[")))
  (define-key global-map [?\s-9] (lambda () (interactive) (insert "]")))
  (define-key global-map [?\s-0] (lambda () (interactive) (insert "}")))
  (define-key global-map [?\s-ß] (lambda () (interactive) (insert "\\")))
  (define-key global-map [?\s-+] (lambda () (interactive) (insert "~")))
  (define-key global-map [?\s-^] (lambda () (interactive) (insert "|")))
  (define-key global-map [?\s-q] (lambda () (interactive) (insert "@")))
)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'multiple-cursors)

(global-set-key (kbd "C-ä") 'mc/mark-next-like-this)
(global-set-key (kbd "C-ö") 'mc/mark-previous-like-this)

(require 'iy-go-to-char)

(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)

(require 'expand-region)
(global-set-key (kbd "C-ü") 'er/expand-region)
