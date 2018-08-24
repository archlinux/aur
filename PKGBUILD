# Maintainer: xiretza <xiretza+aur@gmail.com>
# Contributor: Sausageandeggs <s_stoakley at hotmail.co.uk>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=nautilus-open-terminal-git
_gitname=nautilus-open-terminal
pkgver=0.20.15.g07fe03e
pkgrel=2
pkgdesc="Nautilus plugin for opening terminals in arbitrary local paths and on SSH servers"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/GNOME/nautilus-open-terminal/"
license=('GPL')
depends=('nautilus' 'intltool' 'gettext' 'gconf')
makedepends=('git' 'gnome-common')
provides=('nautilus-open-terminal')
conflicts=('nautilus-open-terminal')

source=('git+https://gitlab.gnome.org/GNOME/nautilus-open-terminal.git'
        'automake.diff'
        'nautilus-open-terminal.patch')

sha256sums=('SKIP'
            '6573ba31b144526f36b1755a1f9b80539def1e89579c1fa868d5a995f2f17ff2'
            '3a3dd0c13dd41e7212c0dd16861e1e9313f2d8e23df754002e711ce2650ec5f1')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g' | sed 's|NAUTILUS_OPEN_TERMINAL_||g' | sed 's|_|.|g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  patch -p1 < "${srcdir}/automake.diff"
  patch -p1 < "${srcdir}/nautilus-open-terminal.patch"
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr
  make || return 1
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/" install
}
