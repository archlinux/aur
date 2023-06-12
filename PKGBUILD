# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Karol Babioch <karol@babioch.de>

pkgname=flamethrower
pkgver=0.11.0
pkgrel=1
pkgdesc='DNS performance and functional testing utility'
arch=(i686 x86_64 aarch64)
url='https://github.com/DNS-OARC/flamethrower'
license=(Apache)
depends=(ldns libuv gnutls libnghttp2)
makedepends=(cmake)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/DNS-OARC/flamethrower/archive/refs/tags/v$pkgver.tar.gz"
  'gcc12.patch'
)
sha256sums=('427f39d7e21e18e68b323a0b9b28260e7d0dedbb9d117b309bf550672fb3fb36'
            'a4f6d3969d0a6fc1ab27982100d6da87c051164f0ca24380bd34f97a58497f7e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 <"$srcdir"/gcc12.patch
}

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDOH_ENABLE=ON

  cmake --build build --target flame
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$srcdir"/build/flame \
    "$pkgdir/usr/bin/flame"

  install -Dm644 "$srcdir"/build/libflamecore.a \
    "$pkgdir/usr/lib/libflamecore.a"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 man/flame.1 \
    "$pkgdir/usr/share/man/man1/flame.1"
}
