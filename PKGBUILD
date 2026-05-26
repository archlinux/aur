# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-rers
_vver=9.0.3
_vrel=2
_uver=0.0.13
pkgver=$_vver
pkgrel=$_vrel
pkgdesc="Regular expression VMOD for Varnish"
arch=('x86_64')
url="https://github.com/varnish-rs/vmod-rers"
license=('BSD-3-Clause')
depends=("varnish=$_vver-$_vrel")
makedepends=('cargo' 'clang' 'openssl' 'pkg-config' 'python-docutils' 'jq')
source=("$pkgname-$_uver.tar.gz::https://github.com/varnish-rs/vmod-rers/archive/refs/tags/v${_uver}.tar.gz")
sha512sums=('c993e046b3cb4d42df1623fd9ff441d013eb0e07c70fff5c58c3e4bff8c6fc1b48004dc29bf1708c6b280f4248fd6a13064720166551deb1fcd9ddc0b3d76484')

prepare() {
    cd "$pkgname-$_uver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$_uver"
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$_uver"
    install -Dt "$pkgdir/$(pkg-config varnishapi --variable=vmoddir)" target/release/*.so
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
