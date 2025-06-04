# Maintainer: jimzrt <jimzrt1@gmail.com>

pkgname=apprenticevr-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A modern, cross-platform desktop application designed for managing and sideloading content onto Meta Quest devices"
arch=('x86_64' 'aarch64')
url="https://github.com/jimzrt/apprenticevr"
license=('GPL3')
depends=('fuse2')
optdepends=('libappindicator-gtk3: for tray icon support')
provides=('apprenticevr')
conflicts=('apprenticevr')
install=apprenticevr.install
options=('!debug' '!strip')
source=("apprenticevr.desktop"
        "apprenticevr.install"
        "https://raw.githubusercontent.com/jimzrt/apprenticevr/main/build/icon.png")
source_x86_64=("https://github.com/jimzrt/apprenticevr/releases/download/v${pkgver}/apprenticevr-${pkgver}-x86_64.AppImage")
source_aarch64=("https://github.com/jimzrt/apprenticevr/releases/download/v${pkgver}/apprenticevr-${pkgver}-arm64.AppImage")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

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