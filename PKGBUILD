# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=cypherock-cysync-appimage
_basename=cypherock-cysync
pkgver=2.3.0
pkgrel=1
pkgdesc="The all-in-one-app to manage your Crypto assets with the Cypherock X1."
arch=('x86_64')
url="https://www.cypherock.com/cysync"
license=('GNU Affero General Public License')
options=('!strip')
install="${_basename}.install"

source=("${_basename}-${pkgver}.AppImage::https://cypherock-updater-v2.s3-accelerate.amazonaws.com/cysync-desktop/${_basename}-${pkgver}-linux-x86_64.AppImage"
        21-cypherock.rules)
sha512sums=('146fe4e9cb4a14826f317492472fe146141637947175c96a9707b549792a5b1c690966b21bdb7affa4af4d2004b9ff7bc1c5d337cdc6f3d7b38d937bc69053a2'
            '222ade4a13aca17237ef320a8bf97ab80f427642b1fd3cad4a77925696425c7054982677907eb05f4420d02750b0d38fb208328afcfa628a62edf6ba685f7ee6')

prepare() {
    cd "${srcdir}"
    rm -rf squashfs-root
    chmod 0755 ${_basename}-${pkgver}.AppImage
    ./${_basename}-${pkgver}.AppImage --appimage-extract
    sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 ${_basename} --no-sandbox %U|" "squashfs-root/Cypherock CySync.desktop"
    sed -i -e "s|Icon=.\+|Icon=cypherock-cysync|" "squashfs-root/Cypherock CySync.desktop"
    echo "MimeType=x-scheme-handler/cypherock;" >> "squashfs-root/Cypherock CySync.desktop"
}

package() {
    cd "${srcdir}"
    install -Dm755 ${_basename}-${pkgver}.AppImage ${pkgdir}/opt/appimages/${_basename}.AppImage
    install -dm755 ${pkgdir}/usr/bin
    ln -s /opt/appimages/${_basename}.AppImage ${pkgdir}/usr/bin/${_basename}
    install -Dm644 "squashfs-root/Cypherock CySync.desktop" "${pkgdir}/usr/share/applications/Cypherock CySync.desktop"
    install -Dm644 "squashfs-root/Cypherock CySync.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cypherock-cysync.png"
    install -Dm644 21-cypherock.rules "${pkgdir}/etc/udev/rules.d/21-cypherock.rules"
}

