# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

pkgname=typst
pkgver=22_03_21_2
pkgrel=1
pkgdesc='A new markup-based typesetting system that is powerful and easy to learn.'
url='https://github.com/typst/typst'
makedepends=('cargo')
depends=('gcc-libs')
arch=('any')
license=('Apache')
_pkgver="${pkgver//_/-}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/typst/typst/archive/${_pkgver}/${_pkgver}.tar.gz")
sha256sums=('fdd3d53496844f22c1ae1b4122250bc33ebb55c3ee12dc22cd1d1f0433724c35')

prepare() {
    cd "$srcdir/$pkgname-${_pkgver}"
    rm cli/build.rs # We set TYPST_HASH explicitly below
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-${_pkgver}"
    export RUSTUP_TOOLCHAIN='stable'
    export CARGO_TARGET_DIR='target'
    export TYPST_HASH="${_pkgver}"
    cargo build -p typst-cli --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-${_pkgver}"
    export RUSTUP_TOOLCHAIN='stable'
    cargo test --workspace --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-${_pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
