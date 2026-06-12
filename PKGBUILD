# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepseek-reasonix-desktop-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="DeepSeek-Reasonix Desktop - Electron-based desktop client for DeepSeek models"
arch=('x86_64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
)
makedepends=('imagemagick')
provides=('deepseek-reasonix-desktop' 'reasonix-desktop')
conflicts=('deepseek-reasonix-desktop' 'reasonix-desktop')
options=('!strip' '!debug')

_relurl="https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v${pkgver}"

source=(
    "Reasonix-${pkgver}-linux-amd64.tar.gz::${_relurl}/Reasonix-linux-amd64.tar.gz"
    'reasonix-desktop.sh'
    'reasonix-desktop.desktop'
    "LICENSE::https://raw.githubusercontent.com/esengine/DeepSeek-Reasonix/main-v2/LICENSE"
    "appicon.png::https://raw.githubusercontent.com/esengine/DeepSeek-Reasonix/main-v2/desktop/build/appicon.png"
)
sha256sums=(
    '39102d33de427d5f5829c69a7c10328b69a503783de3de2dd3b18fbedf7abc40'
    'SKIP'
    'SKIP'
    'SKIP'
    '6778d9b903b3ff5ea8873f9f284be79f8a1d13ddfc3bbd1296bebc09d5d58116'
)

package() {
    # Upstream tarball contains only the reasonix-desktop binary (flat).
    # Install it into /opt/Reasonix
    install -d "${pkgdir}/opt/Reasonix"
    install -Dm755 "${srcdir}/reasonix-desktop" \
        "${pkgdir}/opt/Reasonix/reasonix-desktop"

    # Install wrapper script
    install -Dm755 "${srcdir}/reasonix-desktop.sh" \
        "${pkgdir}/usr/bin/reasonix-desktop"

    # Install .desktop entry
    install -Dm644 "${srcdir}/reasonix-desktop.desktop" \
        "${pkgdir}/usr/share/applications/reasonix-desktop.desktop"

    # Install icons
    # 1024x1024 (original size from upstream)
    install -Dm644 "${srcdir}/appicon.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/reasonix-desktop.png"

    # Generate common sizes for better desktop environment compatibility
    # Use magick (ImageMagick 7+) with convert fallback for older ImageMagick 6
    _magick="magick"
    command -v magick &>/dev/null || _magick="convert"
    for size in 48 128 256 512; do
        install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        ${_magick} "${srcdir}/appicon.png" -resize "${size}x${size}" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/reasonix-desktop.png"
    done

    # Fallback icon for non-icon-theme environments
    install -Dm644 "${srcdir}/appicon.png" \
        "${pkgdir}/usr/share/pixmaps/reasonix-desktop.png"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
