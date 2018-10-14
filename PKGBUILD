# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=station
pkgver=1.25.1
pkgrel=1
pkgdesc='The one app to rule them all'
arch=('x86_64')
url='https://getstation.com/'
license=('MIT')
#depends=('gtk2' 'gconf' 'xdg-utils' 'libxtst' 'libxss' 'nss' 'alsa-lib' 'xdg-utils')
makedepends=('gendesk')
source=(
    "https://github.com/getstation/desktop-app-releases/releases/download/${pkgver}/browserX-${pkgver}-x86_64.AppImage"
)
sha256sums=(
    '966907db8180da331eb73d43d63853e79b3bc6001641e101f904d8ba51bdc704'
)

prepare() {
    chmod u+x ./browserX-${pkgver}-${arch}.AppImage
    ./browserX-${pkgver}-${arch}.AppImage --appimage-extract

    gendesk -f -n \
        --pkgname "$pkgname" \
        --pkgdesc "$pkgdesc" \
        --categories "Network" \
        --mimetypes "x-scheme-handler/${pkgname}"
}

package() {
    install -dm755 "${pkgdir}/usr/lib"
    install -dm755 "${pkgdir}/usr/share"
    install -dm755 "${pkgdir}/usr/bin"

    cp -a "${srcdir}/squashfs-root" "${pkgdir}/usr/lib/${pkgname}"
    find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 "{}" \;

    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons/hicolor/" -exec rename browserx ${pkgname} "{}" \;

    ln -s "/usr/lib/${pkgname}/browserx" "${pkgdir}/usr/bin/${pkgname}"
}

