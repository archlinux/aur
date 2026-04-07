# Maintainer: Licantropo3392 <licantropo3392@gmail.com>
# Contributor: jimzrt <jimzrt1@gmail.com>

pkgname=apprenticevrsrc-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="A modern, cross-platform desktop application designed for managing and sideloading content onto Meta Quest devices"
arch=('x86_64' 'aarch64')
url="https://github.com/mula-bb/apprenticeVrSrc"
license=('GPL3')
depends=('fuse2')
optdepends=('libappindicator-gtk3: for tray icon support')
provides=('apprenticevr')
conflicts=('apprenticevr')
install=apprenticevr.install
options=('!debug' '!strip')
source=("apprenticevr.desktop"
        "apprenticevr.install"
        "https://raw.githubusercontent.com/mula-bb/apprenticeVrSrc/main/build/icon.png")
source_x86_64=("https://github.com/mula-bb/apprenticeVrSrc/releases/download/v${pkgver}/apprenticevr-${pkgver}-x86_64.AppImage")
source_aarch64=("https://github.com/mula-bb/apprenticeVrSrc/releases/download/v${pkgver}/apprenticevr-${pkgver}-arm64.AppImage")
sha256sums=('af5874b444ce6a5b0abc0be3da23446cb239c37979440d0e9149871021a15ece'
            '3bb4054b9cfcc259e110ee6cded02c473b86068444a0a0534a7709928de82d90'
            'c2bcf1dbb3b608655baacddcf3a19532053532f3f21422faa52d9071fd46707b')
sha256sums_x86_64=('c8e5099c89b7e5a9ffb821dc72248f436aba58a6bd16e5992314041f831ae7df')
sha256sums_aarch64=('cf4963cacb1faf629838141ce812db0a88a1df17c495b1a8729a4c5eb183d99e')

prepare() {
    if [ "$CARCH" = "x86_64" ]; then
        chmod +x "${srcdir}/apprenticevr-${pkgver}-x86_64.AppImage"
    elif [ "$CARCH" = "aarch64" ]; then
        chmod +x "${srcdir}/apprenticevr-${pkgver}-arm64.AppImage"
    fi
}

package() {
    # Determine the correct AppImage file based on architecture
    if [ "$CARCH" = "x86_64" ]; then
        _appimage="apprenticevr-${pkgver}-x86_64.AppImage"
    elif [ "$CARCH" = "aarch64" ]; then
        _appimage="apprenticevr-${pkgver}-arm64.AppImage"
    fi
  
    
    # Install the AppImage
    install -d "${pkgdir}/opt/apprenticevr"
    install -m755 "${srcdir}/${_appimage}" "${pkgdir}/opt/apprenticevr/apprenticevr.AppImage"
    
    
    # Create a wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/apprenticevr" << 'EOF'
#!/bin/bash
exec /opt/apprenticevr/apprenticevr.AppImage "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/apprenticevr"
    
    # Install desktop file
    install -Dm644 "${srcdir}/apprenticevr.desktop" "${pkgdir}/usr/share/applications/apprenticevr.desktop"
    
    # Install icon
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/apprenticevr.png"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/apprenticevr.png"
}