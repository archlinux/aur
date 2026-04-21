# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=cypherock-cysync-appimage
_basename=cypherock-cysync
pkgver=2.4.5
pkgrel=1
pkgdesc="The all-in-one-app to manage your Crypto assets with the Cypherock X1."
arch=('x86_64')
url="https://www.cypherock.com/cysync"
license=('GNU Affero General Public License')
options=('!strip')
install="${_basename}.install"

source=("${_basename}-${pkgver}.AppImage::https://cypherock-updater-v2.s3-accelerate.amazonaws.com/cysync-desktop/${_basename}-${pkgver}-linux-x86_64.AppImage"
        21-cypherock.rules)
sha512sums=('868057c0121c98ae9d861e862641fb67a0d334bd4bda01973f91b9bf67d28d3e9e6baba59bf1983e160e730788ce9b6d697b7eec6fecfa44d143fe3ee00bf5ee'
            '222ade4a13aca17237ef320a8bf97ab80f427642b1fd3cad4a77925696425c7054982677907eb05f4420d02750b0d38fb208328afcfa628a62edf6ba685f7ee6')

prepare() {
    cd "${srcdir}"
    rm -rf squashfs-root
    chmod 0755 ${_basename}-${pkgver}.AppImage
    ./${_basename}-${pkgver}.AppImage --appimage-extract
    sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 ${_basename} --no-sandbox %U|" "squashfs-root/cypherock-cysync.desktop"
    sed -i -e "s|Icon=.\+|Icon=cypherock-cysync|" "squashfs-root/cypherock-cysync.desktop"
    echo "MimeType=x-scheme-handler/cypherock;" >> "squashfs-root/cypherock-cysync.desktop"
}

package() {
    cd "${srcdir}"
    install -Dm755 ${_basename}-${pkgver}.AppImage ${pkgdir}/opt/appimages/${_basename}.AppImage
    install -dm755 ${pkgdir}/usr/bin
    ln -s /opt/appimages/${_basename}.AppImage ${pkgdir}/usr/bin/${_basename}
    install -Dm644 "squashfs-root/cypherock-cysync.desktop" "${pkgdir}/usr/share/applications/Cypherock CySync.desktop"
    install -Dm644 "squashfs-root/cypherock-cysync.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cypherock-cysync.png"
    install -Dm644 21-cypherock.rules "${pkgdir}/etc/udev/rules.d/21-cypherock.rules"
}

