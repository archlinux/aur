# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-rers
pkgver=9.0.3
pkgrel=2
_srcver=0.0.13
pkgdesc="Regular expression VMOD for Varnish"
arch=('x86_64')
url="https://github.com/varnish-rs/vmod-rers"
license=('BSD-3-Clause')
depends=("varnish=$pkgver-$pkgrel")
makedepends=('cargo' 'clang' 'openssl' 'pkg-config' 'python-docutils' 'jq')
source=("$pkgname-$_srcver.tar.gz::https://github.com/varnish-rs/vmod-rers/archive/refs/tags/v${_srcver}.tar.gz")
sha512sums=('c993e046b3cb4d42df1623fd9ff441d013eb0e07c70fff5c58c3e4bff8c6fc1b48004dc29bf1708c6b280f4248fd6a13064720166551deb1fcd9ddc0b3d76484')

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
