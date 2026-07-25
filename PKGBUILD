# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale
pkgver=0.9.1
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
sha256sums=('a56796e3309c65830bd1cabb7f012abbcade048d25c4515ccd0fb8a8576efcf7')

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

    # crates/cli ships codewhale; crates/tui ships codewhale-tui.
    # Upstream removed the deepseek/deepseek-tui legacy shims in v0.8.54.
    cargo build --frozen --release \
        --bin codewhale     \
        --bin codewhale-tui
}

package() {
    cd "CodeWhale-${pkgver}"

    install -Dm755 "target/release/codewhale"     "${pkgdir}/usr/bin/codewhale"
    install -Dm755 "target/release/codewhale-tui" "${pkgdir}/usr/bin/codewhale-tui"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
