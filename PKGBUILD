# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=heekscad-git
pkgver=1449.008d7b6f
pkgrel=3
pkgdesc="HeeksCNC is an open source, 3D CAD/CAM software"
arch=('x86_64')
url="http://heeks.net"
license=('custom:BSD3')
depends=('python' 'opencascade' 'wxgtk' 'libarea-git')
makedepends=('git' 'cmake')
source=('git://github.com/Heeks/heekscad.git')
md5sums=('SKIP')
options=(!strip docs libtool emptydirs !zipman staticlibs !upx)

pkgver() {
  cd "${srcdir}/heekscad"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  sed -i 's,#find OCE or OpenCASCADE,set( CMAKE_CXX_FLAGS "-std=c++11" )\n#find OCE or OpenCASCADE,g' "${srcdir}/heekscad/CMakeLists.txt"

  sed -i 's,#find OCE or OpenCASCADE,set( CMAKE_CXX_FLAGS "-std=c++11" )\n#find OCE or OpenCASCADE,g' "${srcdir}/heekscad/src/CMakeLists.txt"
}

build() {
  msg "Starting build..."
  export CASROOT=/opt/opencascade
  cd "${srcdir}/heekscad"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd "$srcdir/heekscad/build"
  make DESTDIR="$pkgdir/" install
}
