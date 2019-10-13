# ContributorMaintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emacs-julia-mode
pkgver=0.3.r300
pkgrel=1
pkgdesc="Emacs major mode for the Julia programming language"
arch=('any')
url="http://www.julialang.org"
license=('GPL')
depends=('emacs')
makedepends=('git')
install=$pkgname.install
source=("git+https://github.com/JuliaEditorSupport/julia-emacs.git#commit=ad6a4944feb61f5c7238cfaf6c99ae63544315c2")
sha256sums=('SKIP')

pkgver() {
  cd julia-emacs
  printf %s.r%s $(grep Version: julia-mode.el| cut -d: -f2|cut -c2-) $(git rev-list --count HEAD) 
}

build() {
  cd julia-emacs
  emacs --batch --eval '(progn
			(push "." load-path)
			(byte-compile-file "julia-latexsubs.el"))'	
  emacs --batch --eval '(progn
			(push "." load-path)
			(byte-compile-file "julia-mode.el"))'
}

package() {
  cd julia-emacs
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install -m644 ${pkgname#emacs-}.el{,c} "$pkgdir"/usr/share/emacs/site-lisp/
  install -m644 julia-latexsubs.el{,c} "$pkgdir"/usr/share/emacs/site-lisp/
}
