# Maintainer: @jonasalv github
pkgname=artix-launcher
pkgver=1.0.0
pkgrel=1
pkgdesc="Artix Games Launcher"
arch=('x86_64')
url="https://artix.com/"
license=('custom')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
provides=('artix-launcher')
conflicts=('artix-launcher')
options=('!strip')

_appimage="Artix_Games_Launcher-x86_64.AppImage"
source=("${pkgname}-${pkgver}.AppImage::https://launch.artix.com/latest/${_appimage}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./${pkgname}-${pkgver}.AppImage --appimage-extract
}

package() {
    cd "${srcdir}"
    install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/artix-launcher"
    
    cd squashfs-root
    
    _desktop=$(find . -maxdepth 1 -name "*.desktop" -print -quit)
    install -Dm644 "${_desktop}" "${pkgdir}/usr/share/applications/artix-launcher.desktop"
    
    sed -i "s|^Exec=.*|Exec=/usr/bin/artix-launcher|g" "${pkgdir}/usr/share/applications/artix-launcher.desktop"
    sed -i "s|^Icon=.*|Icon=artix-launcher|g" "${pkgdir}/usr/share/applications/artix-launcher.desktop"
    
    _icon=$(find . -maxdepth 1 \( -name "*.png" -o -name "*.svg" \) -print -quit)
    if [ -n "$_icon" ]; then
        _ext="${_icon##*.}"
        install -Dm644 "${_icon}" "${pkgdir}/usr/share/pixmaps/artix-launcher.${_ext}"
    fi
}