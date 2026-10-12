# Maintainer: Kazoku <k4zoku@pm.me>
# Contributor: sxlvia <qt715 at proton dot me>

_pkgbase=vosu
pkgname=${_pkgbase}
pkgver=1.0.1
pkgrel=1
pkgdesc='Native osu! telemetry daemon with a local dashboard'
arch=('x86_64')
url='https://github.com/shiruviaa/vosu'
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
    'imagemagick'
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
    magick assets/branding/vosu-app-icon.png -resize 256x256 "$srcdir/vosu.png"
}

package() {
    cd "${_pkgbase}"
    install -Dm755 target/release/vosu \
        "${pkgdir}/usr/bin/vosu"
    install -Dm644 packaging/linux/vosu.desktop \
        "${pkgdir}/usr/share/applications/vosu.desktop"
    install -Dm644 assets/branding/vosu-app-icon.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/vosu.svg"
    install -Dm644 "$srcdir/vosu.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/vosu.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
        LICENSE LICENSE-MIT LICENSE-APACHE THIRD_PARTY_NOTICES.md
}
