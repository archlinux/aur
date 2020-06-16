# Maintainer: lain <aur@hacktheinter.net>
pkgname=jtaghal-git
pkgver=r42.c76f8fe
pkgrel=1
pkgdesc="JTAG Hardware Abstraction Library"
provides=("${pkgname%-git}")
conflicts=(
  "${pkgname%-git}"
  "${pkgname}"
)
arch=('i686' 'x86_64' 'arm')
url='https://github.com/azonenberg/jtaghal-cmake.git'
md5sums=('SKIP')
license=('BSD-3-Clause')
depends=(
	'protobuf'
	'libedit'
)
optdepends=(
	'libusb'
	'libftd2xx'
)
makedepends=('git' 'cmake')
source=(
  'git+https://github.com/azonenberg/jtaghal-cmake.git'
)

pkgver() {
  cd jtaghal-cmake
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd jtaghal-cmake
  git submodule update --init --recursive
  sed -i 's/^#include <ftd2xx\/ftd2xx.h>$/#include <ftd2xx.h>/g' \
  	lib/jtaghal/FTDIDriver.cpp \
	lib/jtaghal/FTDIJtagInterface.cpp \
	lib/jtaghal/FTDISWDInterface.cpp
  sed -i '/^#include <editline\/history.h>$/d' \
    src/jtaghal-apps/jtagsh/jtagsh.h
}

build() {
  cd jtaghal-cmake
  mkdir -p build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "jtaghal-cmake/build"
  make DESTDIR="$pkgdir/" install
}
