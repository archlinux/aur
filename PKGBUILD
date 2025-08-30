# Maintainer: Floréal "stupeflo" Toumikian <floreal@nimukaito.net>

pkgname=fuzzel-pass
pkgver=0.1.1
pkgrel=1
pkgdesc='A password-store frontend for auto-typing passwords'
url='https://codeberg.org/stupeflo/fuzzel-pass'
license=("istsl")
makedepends=('cargo')
depends=('fuzzel' 'wtype' 'pass')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('5d1aa9bd7339c4549d76462b1499327856b133cab43b85dc8f759b6fda951eb13839c4993b99bca1377e4478a749510d5cf1a54a2b076518e5cbc9bc46c7092e')

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
