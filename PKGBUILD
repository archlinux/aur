# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=libsignal-protocol-c
pkgver=2.3.2
pkgrel=1
pkgdesc="Signal Protocol C Library"
arch=('i686' 'x86_64')
url="https://github.com/WhisperSystems/libsignal-protocol-c"
license=('GPL3')
makedepends=('cmake')
checkdepends=('check' 'openssl>=1.0')
source=(https://github.com/WhisperSystems/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('ad742a03263c29a468d00c3dcc0269cf')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build && cd build

  cmake \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
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
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
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
