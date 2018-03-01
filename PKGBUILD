# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=libsignal-protocol-c
pkgver=2.3.1
pkgrel=3
pkgdesc="Signal Protocol C Library"
arch=('i686' 'x86_64')
url="https://github.com/WhisperSystems/libsignal-protocol-c"
license=('GPL3')
makedepends=('cmake')
checkdepends=('check' 'openssl>=1.0')
source=(https://github.com/WhisperSystems/$pkgname/archive/v$pkgver.tar.gz
'openssl1.1.patch')
md5sums=('8321edeba3e0642c4c98d5d2870db8cd'
         '59f4b598a16fde94b3305377adbf7b83')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < $srcdir/openssl1.1.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build && cd build

  cmake \
    -DCMAKE_POSITION_INDEPENDENT_CODE=True \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=0 \
    ..

  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build && cd build

  # Build with tests
  cmake \
    -DCMAKE_POSITION_INDEPENDENT_CODE=True \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=1 \
    ..

  make

  # Build tests
  cd tests
  make
  cd ..

  # Run tests
  ctest
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}
