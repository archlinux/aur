# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi
pkgver=14.1.4
pkgrel=1
pkgdesc="AI coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more"
arch=('x86_64')
url="https://github.com/can1357/oh-my-pi"
license=('MIT')
depends=('gcc-libs' 'glibc' 'icu' 'zlib')
makedepends=('bun' 'rustup' 'zig')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/can1357/oh-my-pi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bdba3b14f6cfe86c83d7466ab26d214f1a562311358c66242b94cccfa193d48c')

build() {
    cd "${srcdir}/oh-my-pi-${pkgver}"

    local _toolchain='nightly-2026-03-27'
    local _rust_target='x86_64-unknown-linux-gnu'
    local _baseline_target="${srcdir}/target-baseline"
    local _modern_target="${srcdir}/target-modern"

    if ! rustup run "${_toolchain}" rustc --version >/dev/null 2>&1; then
        msg2 "Installing rustup toolchain ${_toolchain}..."
        rustup toolchain install "${_toolchain}"
    fi

    export PATH="${HOME}/.cargo/bin:${PATH}"
    export RUSTUP_TOOLCHAIN="${_toolchain}"
    unset CI CC CXX CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS

    bun install

    if [ -e "${_baseline_target}" ]; then rm -r "${_baseline_target}"; fi
    if [ -e "${_modern_target}" ]; then rm -r "${_modern_target}"; fi

    CARGO_TARGET_DIR="${_baseline_target}" RUSTFLAGS='-C target-cpu=x86-64-v2' \
        cargo build --release --target "${_rust_target}" -p pi-natives
    install -Dm755 "${_baseline_target}/${_rust_target}/release/libpi_natives.so" \
        "packages/natives/native/pi_natives.linux-x64-baseline.node"

    CARGO_TARGET_DIR="${_modern_target}" RUSTFLAGS='-C target-cpu=x86-64-v3' \
        cargo build --release --target "${_rust_target}" -p pi-natives
    install -Dm755 "${_modern_target}/${_rust_target}/release/libpi_natives.so" \
        "packages/natives/native/pi_natives.linux-x64-modern.node"

    bun --cwd=packages/coding-agent run build
}

package() {
    cd "${srcdir}/oh-my-pi-${pkgver}"

    install -Dm755 "packages/coding-agent/dist/omp" "${pkgdir}/usr/bin/omp"
    install -Dm755 "packages/natives/native/pi_natives.linux-x64-baseline.node" \
        "${pkgdir}/usr/bin/pi_natives.linux-x64-baseline.node"
    install -Dm755 "packages/natives/native/pi_natives.linux-x64-modern.node" \
        "${pkgdir}/usr/bin/pi_natives.linux-x64-modern.node"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
