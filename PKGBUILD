# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale
pkgver=0.10.0
pkgrel=1
pkgdesc="CodeWhale (formerly DeepSeek-TUI) - DeepSeek-first agentic terminal for open-source coding models"
arch=('x86_64' 'aarch64')
url="https://github.com/Hmbown/CodeWhale"
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus')
makedepends=('rust' 'cargo')
provides=('codewhale-tui' 'deepseek' 'deepseek-tui')
conflicts=('codewhale-bin' 'codewhale-tui' 'deepseek' 'deepseek-tui' 'deepseek-tui-bin')
# Upstream's release binaries have no debug symbols.
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('768bbe90810917d4a989844ff26133412a5c67c6a6b76b334d378de44a936965')
_commit=1be1a703b975fc0a6c125886c761141341615a32

prepare() {
    cd "Codewhale-${pkgver}"

    # Keep cargo state inside $srcdir so the build is reproducible and
    # never touches ~/.cargo.
    export CARGO_HOME="${srcdir}/.cargo"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "Codewhale-${pkgver}"

    export CARGO_HOME="${srcdir}/.cargo"
    export RUSTUP_TOOLCHAIN=stable
    export CODEWHALE_BUILD_SHA="${_commit}"
    # Do not retain the build workspace or Cargo cache in Rust panic paths or
    # rquickjs-sys's compiled C source-location strings.
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}/Codewhale-${pkgver}=/build/codewhale --remap-path-prefix=${srcdir}/.cargo/registry=/cargo-registry"
    export CFLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=/build -fdebug-prefix-map=${srcdir}=/build"


    # crates/cli ships codewhale; crates/tui ships codewhale-tui.
    # Upstream removed the deepseek/deepseek-tui legacy shims in v0.8.54.
    # v0.9.5 narrowed workspace default-members to crates/cli, so codewhale-tui
    # is no longer reachable by bare --bin; select each package explicitly.
    cargo build --frozen --release \
        -p codewhale-cli --bin codewhale \
        -p codewhale-tui --bin codewhale-tui
}

package() {
    cd "Codewhale-${pkgver}"

    install -Dm755 "target/release/codewhale"     "${pkgdir}/usr/bin/codewhale"
    install -Dm755 "target/release/codewhale-tui" "${pkgdir}/usr/bin/codewhale-tui"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
