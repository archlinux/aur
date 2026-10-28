# Maintainer: Kazoku <k4zoku@pm.me>
# Contributor: sxlvia <qt715 at proton dot me>

_pkgbase=vosu
pkgname=${_pkgbase}
pkgver=1.2.2
pkgrel=1
pkgdesc='Native osu! telemetry daemon with a local dashboard'
arch=('x86_64')
url='https://github.com/18-lab-dev/vosu'
license=('MIT OR Apache-2.0' 'CC-BY-4.0')
depends=('glibc' 'libelf' 'zlib' 'libcap' 'icu' 'hicolor-icon-theme')
makedepends=(
    'git'
    'cargo'
    'clang'
    'libbpf'
    'pkgconf'
    'dotnet-sdk-8.0'
    'python'
)
options=('!lto' '!debug')
install=vosu.install
source=("${_pkgbase}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

_toolchain() {
    sed -n 's/^channel *= *"\(.*\)"/\1/p' "${srcdir}/${_pkgbase}/rust-toolchain.toml"
}

prepare() {
    cd "${_pkgbase}"
    RUSTUP_TOOLCHAIN="$(_toolchain)"
    export RUSTUP_TOOLCHAIN
    if command -v rustup >/dev/null; then
        rustup toolchain install "$RUSTUP_TOOLCHAIN" --profile minimal
    fi
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgbase}"
    RUSTUP_TOOLCHAIN="$(_toolchain)"
    export RUSTUP_TOOLCHAIN
    export CARGO_TARGET_DIR=target
    export DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1 NUGET_PACKAGES="$srcdir/nuget"
    python scripts/prepare-offset-generator.py --rid linux-x64
    cargo build --frozen --release --no-default-features --features linux-process-events
}

package() {
    cd "${_pkgbase}"
    install -Dm755 target/release/vosu \
        "${pkgdir}/usr/bin/vosu"
    ln -s vosu "${pkgdir}/usr/bin/vosux"
    install -Dm644 packaging/linux/vosu.desktop \
        "${pkgdir}/usr/share/applications/vosu.desktop"
    local size
    for size in 16 22 24 32 48 64 128 256 512; do
        install -Dm644 "assets/branding/icons/vosu-${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/vosu.png"
    done
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
        LICENSE LICENSE-MIT LICENSE-APACHE THIRD_PARTY_NOTICES.md
}
