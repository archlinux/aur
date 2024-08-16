# Maintainer: Marc Straube <email@marcstraube.de>

pkgname=cypherock-cysync-appimage
pkgver=2.0.9
pkgrel=1
pkgdesc="The all-in-one-app to manage your Crypto assets with the Cypherock X1."
arch=('x86_64')
url="https://www.cypherock.com/cysync"
license=('GNU Affero General Public License')
options=('!strip')
install=cypherock-cysync.install

source=("${pkgname}-${pkgver}.AppImage::https://updater.cypherock.com/cysync-desktop/${pkgname}-${pkgver}-linux-x86_64.AppImage"
        21-cypherock.rules)
sha512sums=('142700c04401a0641d439412fb9edd8ec4e1d4d1e8243fcc35692ed72af5bf71b46edc8dc82acd861f8cb42a18280ce80c0664323fa103c585f92e1feaea9705'
            'b4049a457b983566e96d9883d055a4ac357e0a2d9e7335749231842294d54ade35cef6b516745ab4a17d62da010b7b7789cb6fa4fc52cbc2c12ae06f692ff58a')

prepare() {
    cd "${srcdir}"
    rm -rf squashfs-root
    ./${pkgname}-${pkgver}.AppImage --appimage-extract
    sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 DESKTOPINTEGRATION=0 /usr/bin/${pkgname}|" "squashfs-root/Cypherock CySync.desktop"
    sed -i -e "s|Icon=.\+|Icon=cypherock-cysync|" "squashfs-root/Cypherock CySync.desktop"
}

package() {
    cd "${srcdir}"
    install -Dm755 ${pkgname}-${pkgver}.AppImage ${pkgdir}/opt/appimages/${pkgname}.AppImage
    install -dm755 ${pkgdir}/usr/bin
    ln -s /opt/appimages/${pkgname}.AppImage ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 "squashfs-root/Cypherock CySync.desktop" "${pkgdir}/usr/share/applications/Cypherock CySync.desktop"
    install -Dm644 "squashfs-root/Cypherock CySync.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cypherock-cysync.png"
    install -Dm644 21-cypherock.rules "${pkgdir}/etc/udev/rules.d/21-cypherock.rules"
}

