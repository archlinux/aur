# Maintainer: Zeus-Deus <widow at codemux dot org>
pkgname=codexbar-tui
pkgver=0.1.3
pkgrel=1
pkgdesc="Thin Omarchy-themed terminal UI on top of the codexbar CLI (steipete/CodexBar)"
arch=('x86_64')
url="https://github.com/Zeus-Deus/codexbar-tui"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
    'hyprland: for the Omarchy floating-window hotkey (codexbar-tui-setup-omarchy)'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('01d94ff44abc63731fe19a872b844e098e4d3d2bad1c3fe545e1452fd4ac7479')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    # Rust unit + integration tests.
    cargo test --frozen --release
    # Shell-script integration tests for the Omarchy hotkey installer.
    # Sandboxed — no writes outside a tmp HOME, no sudo.
    bash tests/omarchy-hotkey.sh
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "target/release/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"

    install -Dm755 "scripts/${pkgname}-setup-omarchy" \
        "${pkgdir}/usr/bin/${pkgname}-setup-omarchy"

    install -Dm755 "scripts/${pkgname}-remove-omarchy" \
        "${pkgdir}/usr/bin/${pkgname}-remove-omarchy"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
