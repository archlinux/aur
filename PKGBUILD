# Maintainer: Farouk Mokhtari <faroukmokh@gmail.com>
pkgname=st-duncan-git
_pkgname=st-duncan
pkgver=0.8.2
pkgrel=1
pkgdesc="Simple terminal for X patched with some features"
arch=('i686' 'x86_64')
url="https://github.com/duncan-f/st.git"
license=('MIT')
depends=('libxft')
makedepends=('libxext' 'ncurses' 'git')
provides=('st')
conflicts=('st')
options=('zipman')
source=("${_pkgname}::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  _pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  # skip terminfo which conflicts with nsurses
  sed -i '/tic /d' Makefile
}

build() {
  cd "${_pkgname}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "${_pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
