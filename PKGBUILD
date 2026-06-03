# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>

pkgname=claurst
pkgver=0.1.4
pkgrel=1
pkgdesc="Agentic Coding for Builders who Ship"
arch=('x86_64' 'aarch64')
url="https://github.com/kuberwastaken/claurst"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'libxcb' 'libxkbcommon' 'xdotool')
makedepends=('cargo')
conflicts=('claurst-bin' 'claurst-git')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuberwastaken/claurst/archive/v${pkgver}.tar.gz")
sha256sums=('3a1e8bdc935f43ab3c64c08e6e0ae6485412f41a4e9bed09910ed464c60aee18')

prepare() {
    cd "${pkgname}-${pkgver}/src-rust"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}/src-rust"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "src-rust/target/release/claurst" "${pkgdir}/usr/bin/claurst"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
