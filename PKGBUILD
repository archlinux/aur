# Maintainer: Mattes Rötschke <dev at mattes-roetschke dot de>
pkgname=stuart
pkgver=0.1.1
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

sha256sums=('aad777fea8d9c868fbfe796cebc5d2a3b3359454233587e0866d402715040130')

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
