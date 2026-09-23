# Maintainer: Varnish Software <opensource@varnish-software.com>

pkgname=vmod-oidc
pkgver=9.1.0
pkgrel=2
_srcver=0.2.0
_srcname=vmod_oidc
pkgdesc="OpenID Connect authentication VMOD for Varnish"
arch=('x86_64')
url="https://github.com/perbu/vmod_oidc"
license=('BSD-2-Clause')
depends=("varnish=$pkgver-$pkgrel")
makedepends=('cargo' 'clang' 'openssl' 'pkg-config')
source=("$pkgname-$_srcver.tar.gz::https://github.com/perbu/vmod_oidc/archive/refs/tags/v${_srcver}.tar.gz")
sha512sums=('5655a747c4d79ddc282ee9a771d9c4936b5f0c6a026469efe6a1bfd259eb0eb7cfc4dde914d9d59004d025a862513145f49f4b71482045c353654b000e0164b9')
options=(!lto)

prepare() {
    cd "$_srcname-$_srcver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcname-$_srcver"
    cargo build --frozen --release --features vmod
}

package() {
    cd "$_srcname-$_srcver"
    install -Dt "$pkgdir/$(pkg-config varnishapi --variable=vmoddir)" target/release/*.so
    install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
