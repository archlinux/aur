# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/aur.claurst

pkgname=claurst
pkgver=0.2.1
pkgrel=1
pkgdesc="Agentic Coding for Builders who Ship"
arch=('x86_64' 'aarch64')
url="https://github.com/kuberwastaken/claurst"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'libxcb' 'libxkbcommon' 'xdotool')
makedepends=('cargo' 'cmake' 'clang')
conflicts=('claurst-bin' 'claurst-git')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuberwastaken/claurst/archive/v${pkgver}.tar.gz")
sha256sums=('093daf446d64f96f1a0ccd3e58938744e614511d3fe642400dd8e01bf2797cea')

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
