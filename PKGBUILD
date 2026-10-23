# Maintainer: gimgiwer <gimgiwer@gmail.com>
pkgname=swiftify-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="A Spotify player for the desktop, built with Qt Quick and a Rust core (precompiled binary)"
arch=('x86_64')
url="https://github.com/swiftify-org/swiftify"
license=('custom')
depends=(
    'alsa-lib'
    'libpulse'
    'glibc'
    'gcc-libs'
    'hicolor-icon-theme'
    'xdg-utils'
)
optdepends=(
    'xdg-desktop-portal: native file picker for cover photos'
)
provides=('swiftify')
conflicts=('swiftify')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/swiftify-org/swiftify/releases/download/v${pkgver}/swiftify-${pkgver}-linux-${CARCH}.tar.gz")
sha256sums=('e79b8bc675ef8fb8f6b7f1b680c287942b92fb11da9246065bdd37bb4df654c8')

package() {
    cd "swiftify-${pkgver}-linux-${CARCH}"

    # Install main bundle to /opt/swiftify
    install -d "${pkgdir}/opt/swiftify"
    cp -dr --no-preserve=ownership bin lib plugins qml share translations "${pkgdir}/opt/swiftify/"

    # Symlink binary to /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/swiftify/bin/swiftify "${pkgdir}/usr/bin/swiftify"

    # Install desktop entry
    install -Dm644 share/applications/swiftify.desktop         "${pkgdir}/usr/share/applications/swiftify.desktop"

    # Install icons to system hicolor theme
    for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
        if [ -f "share/icons/hicolor/${size}/apps/swiftify.png" ]; then
            install -Dm644 "share/icons/hicolor/${size}/apps/swiftify.png"                 "${pkgdir}/usr/share/icons/hicolor/${size}/apps/swiftify.png"
        fi
    done

    # Font license
    if [ -f "share/swiftify/fonts/GoogleSansFlex-OFL.txt" ]; then
        install -Dm644 share/swiftify/fonts/GoogleSansFlex-OFL.txt             "${pkgdir}/usr/share/licenses/${pkgname}/GoogleSansFlex-OFL.txt"
    fi
}
