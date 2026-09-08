# Maintainer: blitzkriegfc <blitzkriegfc@gmail.com>
pkgname=qbz
pkgver=2.1.0
pkgrel=1
pkgdesc="Native hi-fi Qobuz desktop player for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/vicrodh/qbz"
license=('MIT')
depends=('qt6-base>=6.8' 'qt6-declarative>=6.8' 'qt6-svg>=6.8' 'qt6-wayland' 'alsa-lib' 'xdg-utils')
makedepends=('rust' 'cmake' 'nasm' 'jack2')
# makepkg's GCC LTO objects cannot be consumed from Rust rlibs by rustc's lld.
options=('!lto' '!debug')
optdepends=(
    'alsa-utils: ALSA diagnostics and device inspection'
    'pipewire: PipeWire device discovery and sample-rate control'
    'libpulse: PulseAudio device discovery and routing through pactl'
    'jack2: JACK audio backend'
)
provides=('qbz')
conflicts=('qbz-bin' 'qbz-git')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/vicrodh/qbz/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}-${pkgver}-cargo-vendor.tar.xz::https://github.com/vicrodh/qbz/releases/download/v${pkgver}/qbz-${pkgver}-cargo-vendor.tar.xz"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    cd "${srcdir}/qbz-${pkgver}"
    mkdir -p .cargo
    printf '%s\n' \
        '[source.crates-io]' \
        'replace-with = "vendored-sources"' \
        '' \
        '[source.vendored-sources]' \
        "directory = \"${srcdir}/qbz-${pkgver}-cargo-vendor\"" \
        '' \
        '[net]' \
        'offline = true' > .cargo/config.toml
}

build() {
    cd "${srcdir}/qbz-${pkgver}"
    # Arch's rust toolchain uses lld; cap its parallelism so this large final
    # link does not exhaust RAM on typical builder machines.
    QMAKE=/usr/bin/qmake6 cargo rustc --release --locked --offline \
        --manifest-path crates/Cargo.toml -p qbz-qt --bin qbz -- \
        -C link-arg=-Wl,--threads=4
}

package() {
    cd "${srcdir}/qbz-${pkgver}"
    install -Dm755 crates/target/release/qbz "${pkgdir}/usr/bin/qbz"
    install -Dm644 packaging/linux/qbz.desktop \
        "${pkgdir}/usr/share/applications/com.blitzfc.qbz.desktop"

    local size
    for size in 32 48 64 128 256 512; do
        install -Dm644 "packaging/icons/${size}x${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/qbz.png"
    done

    install -Dm644 packaging/flatpak/com.blitzfc.qbz.metainfo.xml \
        "${pkgdir}/usr/share/metainfo/com.blitzfc.qbz.metainfo.xml"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}/third-party"
}
