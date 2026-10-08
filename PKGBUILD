# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=codewhale
pkgver=0.10.1
pkgrel=1
pkgdesc="CodeWhale (formerly DeepSeek-TUI) - DeepSeek-first agentic terminal for open-source coding models"
arch=('x86_64' 'aarch64')
# Upstream moved from Hmbown/CodeWhale to the codewhale-hq organization.
url="https://github.com/codewhale-hq/Codewhale"
license=('MIT')
depends=('glibc' 'gcc-libs' 'dbus')
makedepends=('rust' 'cargo')
provides=('codewhale-tui' 'deepseek' 'deepseek-tui')
conflicts=('codewhale-bin' 'codewhale-tui' 'deepseek' 'deepseek-tui' 'deepseek-tui-bin')
# Upstream's release binaries have no debug symbols.
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0b7e025ce1c2c916a089e44bb29ada7239e2153344cce42508ff7534195776ab')
_commit=fead51eeea0fb6038ea3e30923751b1a1c765b25

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
    # rustc rewrites std's /rustc/<commit> paths to the local rust-src copy when
    # that component is installed (e.g. ~/.rustup/...); map it back.
    local _sysroot _rustc_commit
    _sysroot="$(rustc --print sysroot)"
    _rustc_commit="$(rustc -vV | sed -n 's/^commit-hash: //p')"
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}/Codewhale-${pkgver}=/build/codewhale --remap-path-prefix=${srcdir}/.cargo/registry=/cargo-registry --remap-path-prefix=${_sysroot}/lib/rustlib/src/rust=/rustc/${_rustc_commit}"
    export CFLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=/build -fdebug-prefix-map=${srcdir}=/build"


    # crates/cli ships codewhale. v0.10.1 removed the separate codewhale-tui
    # [[bin]] from crates/tui (it is now a library only); upstream publishes
    # codewhale-tui as a byte-identical copy of codewhale, so package() links it.
    cargo build --frozen --release -p codewhale-cli --bin codewhale
}

package() {
    cd "Codewhale-${pkgver}"

    install -Dm755 "target/release/codewhale"     "${pkgdir}/usr/bin/codewhale"
    ln -s codewhale "${pkgdir}/usr/bin/codewhale-tui"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
