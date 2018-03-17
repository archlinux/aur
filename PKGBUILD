# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=heekscad-git
pkgver=1452.82ea9e20
pkgrel=1
pkgdesc="HeeksCNC is an open source 3D CAD/CAM software"
arch=('x86_64')
url="http://heeks.net"
license=('custom:BSD3')
depends=('python2' 'oce' 'wxgtk2' 'libarea-git')
optdepends=('heekscnc-git')
makedepends=('cmake')
provides=('heekscad')
conflicts=('heekscad')
source=('git://github.com/Heeks/heekscad.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/heekscad"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  # fix the hardcoded calls to python
  sed -i 's,#find OCE or OpenCASCADE,set( CMAKE_CXX_FLAGS "-std=c++11" )\n#find OCE or OpenCASCADE,g' "${srcdir}/heekscad/CMakeLists.txt"
  sed -i 's,#find OCE or OpenCASCADE,set( CMAKE_CXX_FLAGS "-std=c++11" )\n#find OCE or OpenCASCADE,g' "${srcdir}/heekscad/src/CMakeLists.txt"
}

build() {
  msg "Starting build..."
  cd "${srcdir}/heekscad"
  mkdir -p build
  cd build
  export OCE_DIR="/opt/oce/lib/oce-0.18"
  cmake -DwxWidgets_CONFIG_EXECUTABLE="/usr/bin/wx-config" -DPYTHON_EXECUTABLE="/usr/bin/python2" -DPYTHON_LIBRARY="/usr/lib/libpython2.7.so" -DPYTHON_INCLUDE_DIR="/usr/include/python2.7" -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd "$srcdir/heekscad/build"
  make DESTDIR="$pkgdir/" install

  mkdir -p "${pkgdir}/usr/share/licenses"
  cp "${srcdir}/heekscad/COPYING" "${pkgdir}/usr/share/licenses/$pkgname"
}
