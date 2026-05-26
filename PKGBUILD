# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-fileserver
pkgver=9.0.3
pkgrel=2
_srcver=0.0.10
pkgdesc="Varnish vmod for serving static files"
arch=('x86_64')
url="https://github.com/varnish-rs/vmod-fileserver"
license=('BSD-3-Clause')
depends=("varnish=$pkgver-$pkgrel")
makedepends=('cargo' 'clang' 'openssl' 'pkg-config' 'python-docutils' 'jq')
source=("$pkgname-$_srcver.tar.gz::https://github.com/varnish-rs/vmod-fileserver/archive/refs/tags/v${_srcver}.tar.gz")
sha512sums=('b504f6389d000211a0dd1087c158d6c6e4518fbea36406ad5b321ee32b09330cb8c28d52508263fcae04a328daa0d2fb9f63789310010691ab9812b1a10f8c64')

prepare() {
    cd "$pkgname-$_srcver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$_srcver"
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$_srcver"
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$_srcver"
    install -Dt "$pkgdir/$(pkg-config varnishapi --variable=vmoddir)" target/release/*.so
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
