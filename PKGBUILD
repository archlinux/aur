# Maintainer: Ackerman
pkgname=rootapp-bin
pkgver=0.9.121
pkgrel=1
pkgdesc="Root App is a new Discord alternative, designed for gaming communities and large online groups"
arch=('x86_64')
url="https://www.rootapp.com"
license=('custom')
depends=('gtk3' 'nss' 'libnotify' 'alsa-lib' 'xdg-utils' 'at-spi2-core' 'fuse2')
provides=('rootapp')
conflicts=('rootapp')
options=('!strip')

source=("Root-${pkgver}-x86_64.AppImage::https://installer.rootapp.com/installer/Linux/X64/Root.AppImage")
sha256sums=('3cab1a0fb3283478c0e7c14530e061ff28f7a288df963bc580bcc069d191e59b')

prepare() {
    chmod +x "${srcdir}/Root-${pkgver}-x86_64.AppImage"
    "${srcdir}/Root-${pkgver}-x86_64.AppImage" --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"
    chmod 755 "${pkgdir}/opt/${pkgname}/AppRun"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/rootapp"

    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/pixmaps/rootapp.png"
    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/rootapp.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/rootapp.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Root
Comment=Root App is a new Discord alternative, designed for gaming communities and large online groups
Exec=rootapp %U
Icon=rootapp
Terminal=false
StartupWMClass=Root
Categories=Network;InstantMessaging;
MimeType=x-scheme-handler/rootapp;
EOF
}
