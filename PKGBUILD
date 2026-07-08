# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>

pkgname=lenza-bin
pkgver=1.0.52
pkgrel=3
pkgdesc="Lenza is a corporate messenger for team communication"
arch=('x86_64')
url="https://lenzaos.com/"
license=('custom')
options=('!strip' '!debug')
_appimage="Lenza-${pkgver}.AppImage"
makedepends=('fuse2' 'squashfs-tools')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'glib2'
    'gtk3'
    'libcups'
    'libdrm'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'libxtst'
    'mesa'
    'nss'
    'pango'
)
noextract=("${_appimage}")
source=("https://storage.lenzaos.com/other/app/linux/Lenza-${pkgver}.AppImage")
sha256sums=('8741a8c819104fe96c375bd5f835df214e4504e264710b0c5e3ba1ead0509fa5')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract

    # Update only from pacman
    rm -f "squashfs-root/resources/app-update.yml"

    # Fix broken category and exec
    sed -i -E 's|^Categories=.*|Categories=Network;InstantMessaging;Chat;|' "squashfs-root/lenza.desktop"
    sed -i -E "s|Exec=.*|Exec=lenza %U|" "squashfs-root/lenza.desktop"
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -a squashfs-root/. "${pkgdir}/opt/${pkgname}/"
    
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a+rX "${pkgdir}/opt/${pkgname}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/lenza" "${pkgdir}/usr/bin/lenza"

    install -Dm644 "squashfs-root/lenza.desktop" "${pkgdir}/usr/share/applications/lenza.desktop"
    install -Dm644 "squashfs-root/lenza.png" "${pkgdir}/usr/share/pixmaps/lenza.png"
}
