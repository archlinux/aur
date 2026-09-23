# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-reqwest
pkgver=9.1.0
pkgrel=2
_srcver=0.1.1
pkgdesc="HTTP client VMOD for Varnish"
arch=('x86_64')
url="https://github.com/varnish-rs/vmod-reqwest"
license=('BSD-3-Clause')
depends=("varnish=$pkgver-$pkgrel")
makedepends=('cargo' 'clang' 'openssl' 'pkg-config' 'python-docutils' 'jq')
source=("$pkgname-$_srcver.tar.gz::https://github.com/varnish-rs/vmod-reqwest/archive/refs/tags/v${_srcver}.tar.gz")
sha512sums=('b8d1b7f2af457b48f1a31dfef074cfaaa520902d2b5534ffe1fd13056fa4051ed3856dc1091a27167cb4a1c61f86eac1eb18e8e721514f8f8ec3baf46dcc2a31')
options=(!lto)

prepare() {
    cd "$pkgname-$_srcver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$_srcver"
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$_srcver"
    install -Dt "$pkgdir/$(pkg-config varnishapi --variable=vmoddir)" target/release/*.so
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
