# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-reqwest
pkgver=9.0.3
pkgrel=2
_srcver=0.0.16
pkgdesc="HTTP client VMOD for Varnish"
arch=('x86_64')
url="https://github.com/varnish-rs/vmod-reqwest"
license=('BSD-3-Clause')
depends=("varnish=$pkgver-$pkgrel")
makedepends=('cargo' 'clang' 'openssl' 'pkg-config' 'python-docutils' 'jq')
source=("$pkgname-$_srcver.tar.gz::https://github.com/varnish-rs/vmod-reqwest/archive/refs/tags/v${_srcver}.tar.gz")
sha512sums=('52f0ae6acf481eea049ed5f88f3b6dbe2d66071db060d925866bb630cd8fa98e9bcce987b428844f75c849944c38a73f22a03df90935bc5795a34d751eed2ec7')

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
