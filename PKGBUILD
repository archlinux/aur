# Maintainer: Floréal "stupeflo" Toumikian <floreal@nimukaito.net>

pkgname=fuzzel-pass
pkgver=0.1.2
pkgrel=1
pkgdesc='A password-store frontend for auto-typing passwords'
url='https://codeberg.org/stupeflo/fuzzel-pass'
license=("istsl")
makedepends=('cargo')
depends=('fuzzel' 'wtype' 'pass')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('0023e6b4be3d1e82be56c6e243d382546da60c862c7267525e919cecd801e907ff1b12fd11a62865933fa24fb689fc1de529f08e8ca6387971f2520c89594b9b')

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
