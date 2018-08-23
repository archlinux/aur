# Maintainer: George Rawlinson <george@rawlinson.net.nz>

_pkgname=goat
pkgname=${_pkgname}-git
pkgver=r151.7f25d1a
pkgrel=1
pkgdesc="Database management frontend written in Qt5 (git version)"
arch=('i686' 'x86_64')
#arch=('any')
url="https://github.com/mispp/goat"
license=('GPL')
provides=(goat)
depends=(hicolor-icon-theme qt5-base)
makedepends=(git qt5-tools)
source=("git+https://github.com/mispp/goat.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  # create Makefile with QMake
  qmake-qt5 \
    "${srcdir}/${_pkgname}/${_pkgname}.pro" \
    PREFIX="/usr"

  # build package
  make
}

package() {
  # make install has some issues, so package manually
  #make -C build INSTALL_ROOT="${pkgdir}" install

  # add binary
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/build/goat"

  # add .desktop
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${_pkgname}/packaging/${_pkgname}.desktop"

  # add icon
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/16x16/apps" "${srcdir}/${_pkgname}/packaging/${_pkgname}.png"
}
