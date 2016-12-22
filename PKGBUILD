# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgname=cmake
pkgname=${_pkgname}36
pkgver=3.6.3
pkgrel=1
pkgdesc='A cross-platform open-source make system'
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info' 'jsoncpp')
makedepends=('qt5-base' 'python-sphinx' 'emacs')
optdepends=('qt5-base: cmake-gui'
            'libxkbcommon-x11: cmake-gui')
source=("https://www.cmake.org/files/v${pkgver%.*}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('7d73ee4fae572eb2d7cd3feb48971aea903bb30a20ea5ae8b4da826d8ccad5fe')

prepare() {
  cd ${_pkgname}-${pkgver}
}

build() {
  cd ${_pkgname}-${pkgver}

  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --system-libs \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/bin/ccmake{,-3.6}
  mv "${pkgdir}"/usr/bin/cmake{,-3.6}
  mv "${pkgdir}"/usr/bin/cpack{,-3.6}
  mv "${pkgdir}"/usr/bin/ctest{,-3.6}

  rm -r "${pkgdir}"/usr/share/aclocal/
}
