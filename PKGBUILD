# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
pkgname=bluemail-bin
pkgver=1.1.12
pkgrel=1
pkgdesc="BlueMail is a free, secure, universal email app, capable of managing an unlimited number of mail accounts"
arch=('x86_64')
url="https://www.bluemail.me"
license=('custom')
provides=('bluemail')

depends=('libglvnd')
optdepends=('libnotify: Desktop notifications')
makedepends=('squashfs-tools' 'imagemagick')

source=("${pkgname}-${pkgver}.snap::https://api.snapcraft.io/api/v1/snaps/download/ZVlj0qw0GOFd5JgTfL8kk2Y5eIG1IpiH_20.snap")

sha512sums=('64ec51f6c247241453bbe43abbb5e96c331b40b07fda57132e5cb93cd5deaf5e7cb51906f53ee2bc234803d7600c182a893d4b6a30e9d3ba915e68164172985c')

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin"

    unsquashfs -f -d "${pkgdir}/opt/bluemail" "${pkgname}-${pkgver}.snap"

    chmod 755 "${pkgdir}/opt/bluemail"
    ln -sf /opt/bluemail/bluemail "${pkgdir}/usr/bin/bluemail"

    # Fix and install desktop icons
    for size in 22 24 32 48 64 128 256 512; do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        convert "${pkgdir}/opt/bluemail/meta/gui/icon.png" -resize "${size}x${size}" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/bluemail.png"
    done

    sed -ri 's/(Icon=).+/\1bluemail/' "${pkgdir}/opt/bluemail/meta/gui/bluemail.desktop"
    install -Dm644 "${pkgdir}/opt/bluemail/meta/gui/bluemail.desktop" "${pkgdir}/usr/share/applications/bluemail.desktop"

    # Cleanup snap vendor files and useless files
    rm -rf "${pkgdir}/opt/bluemail/bin"
    rm -rf "${pkgdir}/opt/bluemail/etc"
    rm -rf "${pkgdir}/opt/bluemail/lib"
    rm -rf "${pkgdir}/opt/bluemail/meta"
    rm -rf "${pkgdir}/opt/bluemail/usr"
    rm -rf "${pkgdir}/opt/bluemail/var"
    rm -f ${pkgdir}/opt/bluemail/*.sh
    rm -f ${pkgdir}/opt/bluemail/libEGL.so
    rm -f ${pkgdir}/opt/bluemail/libGLESv2.so
}
