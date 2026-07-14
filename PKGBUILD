# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-fileserver
pkgver=9.0.3
pkgrel=3
_srcver=0.0.12
pkgdesc="Varnish vmod for serving static files"
arch=('x86_64')
url="https://github.com/varnish-rs/vmod-fileserver"
license=('BSD-3-Clause')
depends=("varnish=$pkgver-$pkgrel")
makedepends=('cargo' 'clang' 'openssl' 'pkg-config' 'python-docutils' 'jq')
source=("$pkgname-$_srcver.tar.gz::https://github.com/varnish-rs/vmod-fileserver/archive/refs/tags/v${_srcver}.tar.gz")
sha512sums=('b9a8d289beefcd4db7caeceb3ed6d7e93187ed85455ec8764c0eca4cc2dcabe325980e4ac37c63fd0b864e9861a8e6074c108fe9a3e647d2bd1eb778051c58a2')
options=(!lto)

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
