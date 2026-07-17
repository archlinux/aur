# Maintainer: Kaolinite

pkgname=protobuf3.21
pkgver=3.21.12
pkgrel=0
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('unzip')
source=("https://github.com/protocolbuffers/protobuf/archive/refs/tags/v3.21.12.tar.gz")
sha512sums=("152f8441c325e808b942153c15e82fdb533d5273b50c25c28916ec568ada880f79242bb61ee332ac5fb0d20f21239ed6f8de02ef6256cc574b1fc354d002c6b0")

prepare() {
  cd "protobuf-$pkgver"

  autoreconf -vfi
}

build() {
  cd "protobuf-$pkgver"
  ./configure --prefix=/usr --program-suffix=3.12
  make -j$(nproc)
}

#check() {
#  cd "protobuf-$pkgver"

  # https://bugzilla.redhat.com/show_bug.cgi?id=1838470
  # https://github.com/protocolbuffers/protobuf/issues/7514
  # Also ignore deprecation warnings. This is an old version of a library
  # so deprecations are inevitable and we won't fix them.
#  make check CXXFLAGS+=' -Wno-error=type-limits -Wno-error=deprecated-declarations' -j$(nproc)
#}

package() {
  cd "protobuf-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/lib/pkgconfig
  rm -f $pkgdir/usr/lib/*.so
  rm -f $pkgdir/usr/lib/*.a

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
