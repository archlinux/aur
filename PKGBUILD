# Maintainer: blitzkriegfc <blitzkriegfc@gmail.com>
pkgname=qbz-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Native hi-fi Qobuz desktop player for Linux (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/vicrodh/qbz"
license=('MIT')
depends=('qt6-base>=6.8' 'qt6-declarative>=6.8' 'qt6-svg>=6.8' 'qt6-wayland' 'alsa-lib' 'xdg-utils')
optdepends=(
    'alsa-utils: ALSA diagnostics and device inspection'
    'pipewire: PipeWire device discovery and sample-rate control'
    'libpulse: PulseAudio device discovery and routing through pactl'
    'jack2: JACK audio backend'
)
provides=('qbz')
conflicts=('qbz' 'qbz-git')
options=('!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/vicrodh/qbz/releases/download/v${pkgver}/qbz_${pkgver}_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/vicrodh/qbz/releases/download/v${pkgver}/qbz_${pkgver}_aarch64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    local release_arch
    case "$CARCH" in
        x86_64) release_arch=amd64 ;;
        aarch64) release_arch=aarch64 ;;
    esac

    cd "${srcdir}/qbz_${pkgver}_${release_arch}"
    install -Dm755 qbz "${pkgdir}/usr/bin/qbz"
    install -Dm644 qbz.desktop "${pkgdir}/usr/share/applications/com.blitzfc.qbz.desktop"

    local size
    for size in 32 48 64 128 256 512; do
        install -Dm644 "icons/hicolor/${size}x${size}/apps/qbz.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/qbz.png"
    done

    install -Dm644 com.blitzfc.qbz.metainfo.xml \
        "${pkgdir}/usr/share/metainfo/com.blitzfc.qbz.metainfo.xml"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}/third-party"
}
