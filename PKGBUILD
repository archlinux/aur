# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=openzwave
pkgver=1.6
pkgrel=6
pkgdesc='A C++ library to control Z-Wave Networks via a USB Z-Wave Controller'
arch=(x86_64)
url=http://www.openzwave.net
license=(LGPL3)
depends=(
  bash
  gcc-libs
  glibc
  libhidapi-libusb.so
  libusb
  tinyxml
)
makedepends=(
  doxygen
  git
)
_tag=890f24b7e88f488eee464ed14c01fbceb276cf2a
source=(
  git+https://github.com/OpenZWave/open-zwave.git#tag=${_tag}
  openzwave-system-libs.patch
)
b2sums=(
  SKIP
  56095ee16bb04184b2bf037d7601bc5431c654e1328cd1ad63f1fcb7d6918bcd65ef4ab30ee2c80f3bf3c50e838f5818d23e9d01569e41125e9e68028d021c59
)

pkgver() {
  cd open-zwave

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd open-zwave

  patch -Np1 -i ../openzwave-system-libs.patch
  sed -e 's/-Werror//' -i cpp/build/Makefile
  find -name Makefile | xargs sed -e 's/-Wno-format//' -i
}

build() {
  export CFLAGS="$CFLAGS -Wno-stringop-truncation -Wno-maybe-uninitialized"
  export CXXFLAGS="$CXXFLAGS -Wno-stringop-truncation -Wno-maybe-uninitialized"
  make -C open-zwave
}

package() {
  make DESTDIR="${pkgdir}" PREFIX=/usr instlibdir=usr/lib/ sysconfdir=etc/openzwave -C open-zwave install
}

# vim: ts=2 sw=2 et:
