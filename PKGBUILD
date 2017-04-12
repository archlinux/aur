# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=anbox-git
_pkgname=anbox
pkgdesc="Anbox"
pkgver=466
pkgrel=1
arch=('x86_64')
url="http://anbox.io/"
license=('GPL3')
depends=('dbus-cpp' 'lxc' 'sdl2' 'protobuf')
makedepends=('cmake' 'git' 'glm')
source=("git+https://github.com/anbox/anbox.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

prepare() {
  cd "$srcdir/${_pkgname}"

  # Don't build tests
  truncate -s 0 tests/CMakeLists.txt
}

build() {
  mkdir -p "$srcdir/${_pkgname}/build"
  cd "$srcdir/${_pkgname}/build"

  cmake .. -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make -C build DESTDIR="$pkgdir/" install
  make -C kernel DESTDIR="$pkgdir/" install
}
