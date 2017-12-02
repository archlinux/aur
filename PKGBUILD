# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Antony Male <antony dot male at geemail dot com>>

pkgname=libsnappy
pkgver=1.1.7
pkgrel=1
pkgdesc="A fast compression/decompression library"
arch=('i686' 'x86_64')
depends=('lzo' 'zlib')
makedepends=('cmake' 'git' 'make' 'pkg-config')
url="https://google.github.io/snappy/"
license=('BSD')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/google/${pkgname#lib}/tar.gz/$pkgver
        snappy.pc)
sha256sums=('3dfa02e873ff51a11ee02b9ca391807f0c8ea0529a4924afa645fbf97163f9d4'
            'd210ff4d3ffe9a987b974a8387d967af66a93bf90d72fedce94a2159d937813e')
provides=('snappy')
conflicts=('snappy')

build() {
  cd "$srcdir/${pkgname#lib}-$pkgver"

  msg2 'Building...'
  # compile without assertions
  CXXFLAGS+=\ -DNDEBUG
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=on \
    .
  make
}

check() {
  cd "$srcdir/${pkgname#lib}-$pkgver"

  # compile without assertions
  CXXFLAGS+=\ -DNDEBUG
  make test
}

package() {
  cd "$srcdir/${pkgname#lib}-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install

  # remove this after the file exists upstream again
  # https://github.com/google/snappy/pull/55
  install -Dm 644 "$srcdir/snappy.pc" -t "$pkgdir/usr/lib/pkgconfig"
}
