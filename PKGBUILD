# Maintainer: Floréal "stupeflo" Toumikian <floreal@nimukaito.net>

pkgname=fuzzel-pass
pkgver=0.1.0
pkgrel=2
pkgdesc='A password-store frontend for auto-typing passwords'
url='https://codeberg.org/stupeflo/fuzzel-pass'
license=("istsl")
makedepends=('cargo')
depends=('fuzzel' 'wtype' 'pass')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('56693f9544fbb5e71a13bb85e5347e534832ab5370b874dc7cc48b713126686dbcd8c22ec7da23fb0f13bbc800428d387208de073791b9e466d953f85abf4b5a')

_real_srcdir="${pkgname}-${pkgver}"

prepare() {
    cd "${_real_srcdir}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_real_srcdir}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${_real_srcdir}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${_real_srcdir}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
