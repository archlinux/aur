# Maintainer: Hanserwei <hanserwei at qq dot com>

pkgname=podman-tui-rs
_pkgname=podman-tui
pkgver=0.1.1
pkgrel=1
pkgdesc="Podman-native terminal management UI written in Rust"
arch=('x86_64')
url="https://github.com/Hanserwei/podman-tui"
license=('MIT')
depends=('glibc' 'libgcc' 'podman')
makedepends=('cargo')
provides=("podman-tui=${pkgver}")
conflicts=('podman-tui')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('23c034c5db56165effd9d0c685e08b94e85a272e90d566175830a171b7b01440')

prepare() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="${srcdir}/cargo-home"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="${srcdir}/cargo-home"
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="${srcdir}/cargo-home"
    export CARGO_TARGET_DIR=target
    cargo test --release --frozen
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
