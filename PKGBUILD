# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-fileserver
pkgver=9.1.0
pkgrel=2
_srcver=0.1.1
pkgdesc="Varnish vmod for serving static files"
arch=('x86_64')
url="https://github.com/varnish-rs/vmod-fileserver"
license=('BSD-3-Clause')
depends=("varnish=$pkgver-$pkgrel")
makedepends=('cargo' 'clang' 'openssl' 'pkg-config' 'python-docutils' 'jq')
source=("$pkgname-$_srcver.tar.gz::https://github.com/varnish-rs/vmod-fileserver/archive/refs/tags/v${_srcver}.tar.gz")
sha512sums=('d07a37d8334c2caac2cebe52358fc039ae1f55a2a1ad8d26ed3649c522a12981a3fa3646e8bccd5711da76db95e533a524f4b252f80449f0a0d39eb75f1c3ac7')
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
