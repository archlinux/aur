# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
# Contributor: TBK <aur at jjtc dot eu>
# Contributor: D. Can Celasun <can[at]dcc[dot]im>

pkgname=bluemail
pkgver=1.140.34
pkgrel=1
pkgdesc="BlueMail is a free, secure, universal email app, capable of managing an unlimited number of mail accounts"
arch=('x86_64')
url="https://www.bluemail.me"
license=('custom')

depends=('libnotify' 'libappindicator-gtk3' 'libxtst' 'nss' 'libxss')
makedepends=('squashfs-tools' 'imagemagick')

options=(!strip)

# Get latest version + link from https://snapcraft.io/bluemail || snap info bluemail || run the following
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/bluemail | jq '.download_url' -r
# curl -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/bluemail | jq '.version' -r
source=('LICENSE'
        "${pkgname}-${pkgver}.snap::https://api.snapcraft.io/api/v1/snaps/download/ZVlj0qw0GOFd5JgTfL8kk2Y5eIG1IpiH_170.snap"
        "${pkgname}.sh")

sha512sums=('546994dbf25972659db6130402926020fdfc763b3f41580d812aeb785824218bae1204babe99af51ad91fd758ad0e7f4d0636a00e9130ce13fc6ebb90540e9dc'
            '45429128a1e4d325049a7d2af4c824eac9750c306447730035bb9452f2c43a8a69ad4ef823cea915446774d9d04866c9334049f228e4626f2ec12ba911537914'
            'bda81fca25dbe3792c8a613666f5bc8635dfa2bb8786a5ddd90586ab30090a7dba8154614f6f94a38060fb53cb81f0c2d8417389c18aad870dc52db3904dd12d')

package() {
    mkdir -p "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/bin"

    unsquashfs -f -d "${pkgdir}/opt/bluemail" "${pkgname}-${pkgver}.snap"

    # Fix too open folder permission
    chmod 755 "${pkgdir}/opt/bluemail"

    # Install launcher
    install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/bluemail"

    # Fix and install desktop icons
    for size in 22 24 32 48 64 128 256 512; do
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        magick "${pkgdir}/opt/bluemail/meta/gui/icon.png" -resize "${size}x${size}" \
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
