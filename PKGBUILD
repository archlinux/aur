# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>
# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=libqtxdg
pkgname="${_pkgname}"-git
pkgver=4.5.0.r4.gf184462
pkgrel=1
pkgdesc='Library providing freedesktop.org specs implementations for Qt.'
arch=('i686' 'x86_64' 'aarch64')
url='https://lxqt-project.org'
license=('LGPL-2.1-only')
depends=('qt6-base' 'qt6-svg')
makedepends=('git' 'cmake' 'lxqt-build-tools-git')
checkdepends=('xorg-server-xvfb')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/lxqt/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
  rm -Rf build && mkdir -p build
  cd build
  cmake ../${_pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTS=ON
  make
}

check() {
  cd build
  xvfb-run make test
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
