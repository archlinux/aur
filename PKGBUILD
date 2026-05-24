# Maintainer: jinzhongjia <mail@nviemr.org>

pkgname=codewhale
pkgver=0.8.42
pkgrel=1
pkgdesc="CodeWhale (formerly DeepSeek-TUI) - DeepSeek-first agentic terminal for open-source coding models"
arch=('x86_64' 'aarch64')
url="https://github.com/Hmbown/CodeWhale"
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus')
makedepends=('rust' 'cargo')
provides=('codewhale-tui' 'deepseek' 'deepseek-tui')
conflicts=('codewhale-bin' 'codewhale-tui' 'deepseek' 'deepseek-tui' 'deepseek-tui-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8afa45dea1c27dd1c488e489983592d05588d71bbd1e35a2fa7a3a256998d083')

prepare() {
    cd "CodeWhale-${pkgver}"

    # Keep cargo state inside $srcdir so the build is reproducible and
    # never touches ~/.cargo.
    export CARGO_HOME="${srcdir}/.cargo"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "CodeWhale-${pkgver}"

    export CARGO_HOME="${srcdir}/.cargo"
    export RUSTUP_TOOLCHAIN=stable

    # crates/cli ships two bins (codewhale + deepseek legacy shim);
    # crates/tui ships two more (codewhale-tui + deepseek-tui shim).
    # Build all four in one cargo invocation so they share the dep
    # compile rather than re-doing it.
    cargo build --frozen --release \
        --bin codewhale     \
        --bin codewhale-tui \
        --bin deepseek      \
        --bin deepseek-tui
}

package() {
    cd "CodeWhale-${pkgver}"

    install -Dm755 "target/release/codewhale"     "${pkgdir}/usr/bin/codewhale"
    install -Dm755 "target/release/codewhale-tui" "${pkgdir}/usr/bin/codewhale-tui"
    # Legacy shims; drop these two install lines once upstream removes
    # them in v0.9.0.
    install -Dm755 "target/release/deepseek"      "${pkgdir}/usr/bin/deepseek"
    install -Dm755 "target/release/deepseek-tui"  "${pkgdir}/usr/bin/deepseek-tui"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
