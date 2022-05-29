# Contributor: Kyle Keen <keenerd@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Sandarr95

pkgname=femto-emacs-git
pkgver=2019.12.16.abb1c38
pkgrel=2
pkgdesc="Tiny emacs clone with configuring in FemtoLisp"
url="https://github.com/FemtoEmacs/Femto-Emacs/"
arch=('i686' 'x86_64')
license=('custom')
depends=('ncurses' 'termcap')
makedepends=('git')
conflicts=('femto-emacs')
provides=('femto-emacs')
source=('git+https://github.com/FemtoEmacs/Femto-Emacs.git')
md5sums=('SKIP')
_gitname="Femto-Emacs"

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci %h" HEAD | cut -d ' ' -f '1,4' | tr ' -' '.'
}

prepare() {
  cd "$_gitname"
  sed -i 's|"femtolisp/aliases.scm"|"/usr/share/femto-emacs/aliases.scm"|' init.lsp
  sed -i 's|getenv("HOME")|"/usr/share/femto-emacs"|' femtolisp/flcall.c
}

build() {
  cd "$_gitname"
  make PREFIX="/usr"
}

package() {
  cd "$_gitname"
  install -Dm755 femto                 "$pkgdir"/usr/bin/femto
  install -Dm644 femto.boot            "$pkgdir"/usr/bin/femto.boot
  install -Dm644 init.lsp              "$pkgdir"/usr/share/femto-emacs/init.lsp
  install -Dm644 femtolisp/aliases.scm "$pkgdir"/usr/share/femto-emacs/aliases.scm
  install -Dm644 femtolisp/LICENSE     "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
