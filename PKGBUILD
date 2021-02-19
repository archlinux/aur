# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=bluemail
pkgver=1.1.63
pkgrel=1
pkgdesc="BlueMail is a free, secure, universal email app, capable of managing an unlimited number of mail accounts"
arch=('x86_64')
url="https://www.bluemail.me"
license=('custom')
conflicts=('bluemail-bin')
provides=('bluemail')

depends=('libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' 'libxss')
makedepends=('squashfs-tools' 'imagemagick')

# Get latest version + link from https://snapcraft.io/bluemail || snap info bluemail || run the following
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/bluemail | jq '.download_url' -r
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/bluemail | jq '.version' -r
source=('LICENSE'
        "${pkgname}-${pkgver}.snap::https://api.snapcraft.io/api/v1/snaps/download/ZVlj0qw0GOFd5JgTfL8kk2Y5eIG1IpiH_68.snap")

sha512sums=('546994dbf25972659db6130402926020fdfc763b3f41580d812aeb785824218bae1204babe99af51ad91fd758ad0e7f4d0636a00e9130ce13fc6ebb90540e9dc'
            'd7e1ff3d181e8f212860341135e806fd9bb730706a87c1d45cdcf47eb3ed9d8540f1cc884f52aca1c91ac20c84b689fdb2bf5844958b34b58e9a99ad7fdf9f4d')

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
    rm -r "${pkgdir}/opt/bluemail/lib"
    rm -r "${pkgdir}/opt/bluemail/meta"
    rm -r "${pkgdir}/opt/bluemail/usr"
    rm ${pkgdir}/opt/bluemail/*.sh
    rm ${pkgdir}/opt/bluemail/libEGL.so
    rm ${pkgdir}/opt/bluemail/libGLESv2.so
}
