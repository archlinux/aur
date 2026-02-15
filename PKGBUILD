# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=zenoh-c
pkgver=1.7.2
pkgrel=1
pkgdesc="C API for Zenoh"
arch=('any')
url="https://zenoh.io/"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'ninja' 'rust')
source=("https://github.com/eclipse-zenoh/zenoh-c/archive/$pkgver.tar.gz"
        "static_init.patch")
sha256sums=('5d5adc694ea47b67626a5dfcb1f41f342b9e156864f9162b77a430711962594c'
            '118eb4399eb1c9df3bbe1011cabd5ad49762d203846e8184e84c6fed2f32f370')

options=(!debug)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch --strip=1 --input="$srcdir/static_init.patch"
  cargo update
  cd "$srcdir/$pkgname-$pkgver/build-resources/opaque-types/"
  cargo update
}

build() {
  cmake -GNinja -B build -S "$pkgname-$pkgver" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DZENOHC_BUILD_WITH_UNSTABLE_API:BOOL=ON \
           -DZENOHC_BUILD_WITH_SHARED_MEMORY:BOOL=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
