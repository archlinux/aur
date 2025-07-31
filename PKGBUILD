# Maintainer: Steve Seguin <steve@seguin.email>

pkgname=socialstreamninja
pkgver=0.3.43
pkgrel=1
pkgdesc="Standalone version of Social Stream Ninja - Electron-based application for capturing social media streams"
arch=('x86_64')
provides=('socialstreamninja')
conflicts=('socialstreamninja-bin' 'socialstreamninja-git')
url="https://github.com/steveseguin/ssn_app"
license=('GPL3')
depends=('fuse' 'zlib' 'glibc')
optdepends=('gtk3: GTK integration' 'nss: Network security services' 'libxss: X11 screensaver extension' 'libnotify: Desktop notifications' 'libxtst: X11 testing')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/steveseguin/social_stream/releases/download/${pkgver}/socialstreamninja_linux_v${pkgver}_x86_64.AppImage"
        "socialstreamninja.desktop")
sha256sums=('SKIP'
            'SKIP')
noextract=("${pkgname}-${pkgver}.AppImage")
options=('!strip')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install extracted AppImage contents
    install -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"
    
    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}/opt/${pkgname}"
    chmod +x "${pkgdir}/opt/${pkgname}/socialstreamninja"
    
    # Install desktop file
    install -Dm644 "${srcdir}/socialstreamninja.desktop" "${pkgdir}/usr/share/applications/socialstreamninja.desktop"
    
    # Install icon
    if [ -f "${srcdir}/squashfs-root/socialstreamninja.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/socialstreamninja.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/socialstreamninja.png"
    fi
    
    # Create executable symlink
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/socialstreamninja" "${pkgdir}/usr/bin/socialstreamninja"
}