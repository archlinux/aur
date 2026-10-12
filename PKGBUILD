# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=proj
pkgname="${_pkgname}"-git
pkgver=9.9.0.r37.ge75fbeda
pkgrel=1
pkgdesc='Cartographic Projections and Coordinate Transformations Library'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/osgeo/proj'
license=('MIT')
depends=('curl' 'libtiff')
makedepends=('git' 'cmake' 'python-pyyaml' 'python-ruamel-yaml' 'python-pytest' 'gtest')
provides=("$_pkgname" "$_pkgname.4")
conflicts=("$_pkgname" "$_pkgname.4")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd ${_pkgname}
  git describe --always | sed 's/-/.r/;s/-/./'
}

build() {
  mkdir -p build ; cd build
  cmake "${srcdir}"/${_pkgname} -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check(){
  ctest --test-dir build
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}"/${_pkgname}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
