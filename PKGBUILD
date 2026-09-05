# Maintainer: Steve Seguin <steve@seguin.email>
# Contributor: Arthur Stuhl <ArturKauffmann@proton.me>

pkgname=socialstreamninja
pkgver=0.4.18
pkgrel=3
_release_tag=v0.4.18
pkgdesc="Standalone version of Social Stream Ninja - Electron-based application for capturing social media streams"
arch=('x86_64')
provides=('socialstreamninja')
conflicts=('socialstreamninja-bin' 'socialstreamninja-git')
url="https://github.com/steveseguin/ssn_app"
license=('GPL3')
depends=('zlib' 'glibc' 'gtk3' 'nss' 'alsa-lib' 'libcups' 'mesa')
optdepends=('noto-fonts: General-purpose font coverage' 'noto-fonts-emoji: Emoji icons' 'noto-fonts-cjk: Chinese, Japanese, and Korean text' 'qt6-base: Qt6 framework integration' 'wayland: A computer display server protocol' 'libxss: X11 screensaver extension' 'libnotify: Desktop notifications' 'libxtst: X11 testing')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/steveseguin/social_stream/releases/download/${_release_tag}/socialstreamninja_linux_v${pkgver}_x86_64.AppImage"
        "socialstreamninja.desktop")
sha256sums=('1ed1406de5a75faae6bb3fc4572ac76bde44f78585c01f77c2eb888d98ff8c14'
            'ccfc7e5ee7217e07c94fb008f9631b1747a53d54a362841bc3f412999be611c7')
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
