pkgbase=pictopy
pkgname=(pictopy-bin)
pkgver=1.1.0
pkgrel=2
pkgdesc="PictoPy - Desktop image gallery (Tauri/Python)"
arch=('x86_64')
url="https://github.com/AOSSIE-Org/PictoPy"
license=('GPL3')
depends=('gtk3' 'webkit2gtk' 'python' 'hicolor-icon-theme')
makedepends=('binutils' 'tar')
source=("${pkgname}-${pkgver}.deb::https://github.com/tushar1977/PictoPy/releases/download/release/PictoPy_${pkgver}_amd64.deb")
# Replace 'SKIP' with actual hash using: updpkgsums
sha256sums=('SKIP') 

package() {
    cd "${srcdir}"

    # Install the main application binary
    install -Dm755 "usr/bin/picto-py" "${pkgdir}/usr/bin/pictopy"

    # Install libraries and resources
    if [ -d "usr/lib" ]; then
        cp -r usr/lib "${pkgdir}/usr/"
    fi

    # Install desktop entry
    install -Dm644 "usr/share/applications/picto-py.desktop" \
        "${pkgdir}/usr/share/applications/pictopy.desktop"

    # Update desktop entry to use correct binary name
    sed -i 's/Exec=picto-py/Exec=pictopy/g' "${pkgdir}/usr/share/applications/pictopy.desktop"

    # Install icons
    for size in 32x32 128x128 256x256; do
        if [ -f "usr/share/icons/hicolor/${size}/apps/picto-py.png" ]; then
            install -Dm644 "usr/share/icons/hicolor/${size}/apps/picto-py.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}/apps/pictopy.png"
        fi
    done

    # Install scalable icon if available
    if [ -f "usr/share/icons/hicolor/scalable/apps/picto-py.svg" ]; then
        install -Dm644 "usr/share/icons/hicolor/scalable/apps/picto-py.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pictopy.svg"
    fi

    # Install license
    install -Dm644 "${srcdir}/../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}