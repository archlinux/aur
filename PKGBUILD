# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-reqwest
_vver=9.0.3
_vrel=2
_uver=0.0.16
pkgver=$_vver
pkgrel=$_vrel
pkgdesc="HTTP client VMOD for Varnish"
arch=('x86_64')
url="https://github.com/varnish-rs/vmod-reqwest"
license=('BSD-3-Clause')
depends=("varnish=$_vver-$_vrel")
makedepends=('cargo' 'clang' 'openssl' 'pkg-config' 'python-docutils' 'jq')
source=("$pkgname-$_uver.tar.gz::https://github.com/varnish-rs/vmod-reqwest/archive/refs/tags/v${_uver}.tar.gz")
sha512sums=('52f0ae6acf481eea049ed5f88f3b6dbe2d66071db060d925866bb630cd8fa98e9bcce987b428844f75c849944c38a73f22a03df90935bc5795a34d751eed2ec7')

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
