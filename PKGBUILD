# Maintainer: fuero <fuerob@gmail.com>
_pkgname=bttf
pkgname=bttf
pkgver=0.1.4
pkgrel=1
pkgdesc='command line tool for datetime arithmetic, parsing, formatting and more'
url='https://github.com/BurntSushi/bttf'
license=('MIT' 'Unlicense')
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate"
)
sha256sums=('4b2009adc3d337b9d9b135b2e679ef969fb731dd78458da629e8e21ce7ae1f3a')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd $_pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $_pkgname-$pkgver
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $_pkgname-$pkgver
    cargo test --frozen --all-features
}

package() {
    cd $_pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644  -t "${pkgdir}/usr/share/doc/${pkgname}" *.md
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}
