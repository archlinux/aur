# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepseek-reasonix-desktop-bin
pkgver=1.17.20
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
    "appicon-${pkgver}.png::https://raw.githubusercontent.com/esengine/DeepSeek-Reasonix/desktop-v${pkgver}/desktop/build/appicon.png"
)
sha256sums=(
    'c763e4fb23f3a20af47a8018efe1515358b4be46a84947e976278391d1588408'
    'SKIP'
    'SKIP'
    '03a8452c6cfc366885b9a97fd5947db325d0831b274013356313fd6cf69357ff'
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
    install -Dm644 "${srcdir}/appicon-${pkgver}.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/reasonix-desktop.png"

    # Generate common sizes for better desktop environment compatibility
    # Use magick (ImageMagick 7+) with convert fallback for older ImageMagick 6
    _magick="magick"
    command -v magick &>/dev/null || _magick="convert"
    for size in 48 128 256 512; do
        install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        ${_magick} "${srcdir}/appicon-${pkgver}.png" -resize "${size}x${size}" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/reasonix-desktop.png"
    done

    # Fallback icon for non-icon-theme environments
    install -Dm644 "${srcdir}/appicon-${pkgver}.png" \
        "${pkgdir}/usr/share/pixmaps/reasonix-desktop.png"

}
