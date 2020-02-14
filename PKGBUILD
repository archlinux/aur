# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=openbabel2
pkgver=2.4.1
pkgrel=1
pkgdesc="A library designed to interconvert between many file formats used in molecular modeling and computational chemistry (libs only)"
arch=('x86_64')
url="https://openbabel.org/wiki/Main_Page"
license=('GPL')
depends=('libxml2' 'libsm')
optdepends=('wxgtk: GUI interface')
makedepends=('cmake' 'eigen' 'wxgtk' 'boost' 'python')
source=("https://downloads.sourceforge.net/${pkgname%2}/${pkgname%2}-${pkgver}.tar.gz")
md5sums=('d9defcd7830b0592fece4fe54a137b99')

prepare() {
  mkdir -p build
}

build() {
  cd build
  #export CXXFLAGS+=' -std=gnu++98'
  cmake ../openbabel-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
    -DPYTHON_BINDINGS=ON
  make

  # To split python bindings
  sed -i '/scripts.cmake_install.cmake/d' cmake_install.cmake
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/include/inchi"
  rm -rf "${pkgdir}/usr/lib/libinchi.so"
  rm -rf "${pkgdir}/usr/lib/libinchi.so.0"
  rm -rf "${pkgdir}/usr/lib/libinchi.so.0.4.1"
  rm -rf "${pkgdir}/usr/lib/libopenbabel.so"
  rm -rf "${pkgdir}/usr/share/man"
}
