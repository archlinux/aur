# Maintainer: Your Name <you@example.com>
pkgname=obscura-browser
pkgver=0.1.4
pkgrel=1
pkgdesc="Open-source headless browser for AI agents and web scraping (Rust/V8/CDP)"
arch=('x86_64' 'aarch64')
url="https://github.com/h4ckf0r0day/obscura"
license=('Apache-2.0')
depends=()           # single static binary, no runtime deps
makedepends=(
    'rust'           # >= 1.75 required
    'cargo'
    'clang'          # needed by rusty_v8 to compile V8
    'python'         # gn (V8 build system) requires Python
    'ninja'
    'gn'
)
options=('!lto')     # LTO conflicts with some V8 build steps
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/h4ckf0r0day/obscura/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('c78d91fa6d9985c5a8d76f4ab1c391c45103108956a902fcf8d04ced1ed76083')

# Uncomment to enable anti-fingerprinting + tracker blocking (stealth mode).
# When enabled, pass --stealth at runtime to activate.
# _stealth_feature="--features stealth"

_srcname=obscura

prepare() {
    cd "${_srcname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_srcname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS+=" --remap-path-prefix=${srcdir}=/usr/src/debug/${pkgname}"

    # V8 compiles from source on first build (~5 min, cached afterward).
    # Ensure enough RAM is available (4 GB+ recommended).
    cargo build \
        --frozen \
        --release \
        ${_stealth_feature}
}

check() {
    cd "${_srcname}-${pkgver}"
    cargo test --frozen --release ${_stealth_feature}
}

package() {
    cd "${_srcname}-${pkgver}"
    install -Dm755 "target/release/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"
    install -Dm755 "target/release/${_srcname}-worker" "${pkgdir}/usr/bin/${_srcname}-worker"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
