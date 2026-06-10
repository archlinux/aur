# Maintainer: Mattes Rötschke <dev at mattes-roetschke dot de>
pkgname=stuart
pkgver=0.1.0
pkgrel=1
pkgdesc="A serial terminal TUI"
arch=('x86_64')
url="https://github.com/mroetsc/stuart"
license=('AGPL-3.0-only')
provides=('stuart')
conflicts=('stuart-bin')
depends=('gcc-libs')
makedepends=('cargo')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/mroetsc/stuart/archive/refs/tags/${pkgver}.tar.gz"
)

sha256sums=('a580b72640b1558751dc67b551a60320f47b786b91beb69de0f6b66815d9eb92')

options=('!debug')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/stuart" "${pkgdir}/usr/bin/stuart"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
