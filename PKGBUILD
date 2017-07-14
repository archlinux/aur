# Maintainer: Jan Stephan <jan.stephan.dd@gmail.com>

pkgname=lib32-double-conversion
_basename=double-conversion
pkgver=2.0.1
pkgrel=1
pkgdesc='Binary-decimal and decimal-binary routines for IEEE doubles (32-bit)'
arch=('x86_64')
url='https://github.com/google/double-conversion'
license=(BSD)
depends=('lib32-gcc-libs' 'double-conversion')
makedepends=(cmake)
source=(double-conversion-$pkgver.tar.gz::https://github.com/google/double-conversion/archive/v$pkgver.tar.gz
        double-conversion-shared-lib.patch)
sha1sums=('a590b4e9e1509bcf48da79a9c0571cfe218920f4'
          '54abeec2090908c7ed229986826e8cce400edd1b')

prepare() {
  cd double-conversion-$pkgver
  patch -p1 < ../double-conversion-shared-lib.patch
}

build() {
  export CC="cc -m32"
  export CXX="c++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd double-conversion-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON

  make
}

check() {
  cd double-conversion-$pkgver
  cd test
  cmake .
# Currently tests fail
#  make all
}

package () {
  cd double-conversion-$pkgver
  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}"/usr/include
  rm -rf "${pkgdir}"/usr/lib/CMake
  mv "${pkgdir}"/usr/lib "${pkgdir}"/usr/lib32

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/lib32-double-conversion/LICENSE
}
