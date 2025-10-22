pkgname=unraid-usb-creator-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A tool to create bootable USB drives for Unraid"
url="https://unraid.net"
arch=('x86_64')
license=('custom')
depends=(fuse2)
provides=(unraid-usb-creator)
options=('!strip')
source=(
    "https://github.com/unraid/usb-creator-next/releases/download/v${pkgver}/unraid-usb-creator-${pkgver}.appimage"
)

sha256sums=('348fd23203aece27ef8e1b4ae0fcbdea56ee23fbaf24ed0d88caf6ccdb4d4949')

_installdir=/opt/unraid-usb-creator

prepare() {
    chmod a+x ./unraid-usb-creator-${pkgver}.appimage
    ./unraid-usb-creator-${pkgver}.appimage --appimage-extract >/dev/null
    cp "squashfs-root/usr/share/icons/hicolor/scalable/apps/unraid.svg" "squashfs-root/unraid-usb-creator.svg"
    cp "squashfs-root/usr/share/applications/com.limetech.unraid-usb-creator.desktop" "squashfs-root/unraid-usb-creator.desktop"
    sed -i "s#Exec=unraid-usb-creator#Exec=${_installdir}/unraid-usb-creator.appimage#" "squashfs-root/unraid-usb-creator.desktop"
    sed -i "s+^Icon=.*+Icon=unraid-usb-creator+" "squashfs-root/unraid-usb-creator.desktop"
}
package (){
    install -Dm755 "unraid-usb-creator-${pkgver}.appimage" "${pkgdir}/${_installdir}/unraid-usb-creator.appimage"
    install -Dm644 "squashfs-root/unraid-usb-creator.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/unraid.svg"
    install -Dm644 "squashfs-root/unraid-usb-creator.desktop" "${pkgdir}/usr/share/applications/unraid-usb-creator.desktop"
}