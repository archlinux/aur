# Maintainer: gimgiwer <gimgiwer@gmail.com>
pkgname=swiftify-bin
pkgver=0.24.5
pkgrel=1
pkgdesc="A Spotify player for the desktop, built with Qt Quick and a Rust core (precompiled binary)"
arch=('x86_64')
url="https://github.com/swiftify-org/swiftify"
license=('GPL-3.0-or-later')
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
sha256sums=('2fffb45f7dd61abe0dda91086e27947ba46bf6780f5eed51f958d1d6e059a9c9')

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

    # Licenses
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    if [ -d "share/licenses/swiftify" ]; then
        install -Dm644 share/licenses/swiftify/* "${pkgdir}/usr/share/licenses/${pkgname}/"
    fi
    if [ -f "share/swiftify/fonts/GoogleSansFlex-OFL.txt" ]; then
        install -Dm644 share/swiftify/fonts/GoogleSansFlex-OFL.txt             "${pkgdir}/usr/share/licenses/${pkgname}/GoogleSansFlex-OFL.txt"
    fi
}
