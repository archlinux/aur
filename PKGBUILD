# Maintainer: huochenghai <huochenghai@gmail.com>

_basepkgname=ficus
pkgname=${_basepkgname}-desktop-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Ficus is a software for editing and managing markdown documents, developed by the gg=G team."
arch=('x86_64')
url="https://ficus.world/"
_githuburl="https://github.com/Thysrael/Ficus"
license=('MIT')
provides=("${pkgname}-${pkgver}")
conflicts=("${pkgname}" "${_basepkgname}-bin")
depends=(libxshmfence libxkbcommon pango gtk2 libxcb gtk3 libxdamage gcc-libs bash libxrandr at-spi2-core nspr libx11 libxfixes
        nss dbus cairo alsa-lib libdbusmenu-gtk2 dbus-glib libdbusmenu-glib libindicator-gtk2)
makedepends=('gendesk')
options=('strip')
noextract=("${pkgname}-${pkgver}.AppImage")
source=("${pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_basepkgname}-${pkgver}.AppImage"
        'LICENSE::https://raw.githubusercontent.com/Thysrael/Ficus/main/LICENSE')
sha256sums=('598a5268b2779f8513ce9385f51fc15c30cdc36e7f58073c9c3219ed2ef0e677'
        '062dfd6ae4c19f555ebbdba752598c98510837687393a38a3602b711890430d7')

package() {
        chmod 755 ./${pkgname}-${pkgver}.AppImage
        ./${pkgname}-${pkgver}.AppImage --appimage-extract
        install -Dm644 squashfs-root/usr/share/icons/hicolor/0x0/apps/ficus.png "${pkgdir}/usr/share/pixmaps/ficus.png"
        gendesk -f -n --pkgname "${pkgname%-bin}" \
                --pkgdesc "$pkgdesc" \
                --name "Ficus" \
                --comment "$pkgdesc" \
                --exec "${pkgname%-bin}" \
                --categories 'Utility' \
                --icon "${_basepkgname}"
        install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
        install -d "${pkgdir}/usr/bin"
        install -d "${pkgdir}/opt"
        cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname%-bin}"
        ln -s /opt/${pkgname%-bin}/AppRun "${pkgdir}/usr/bin/${pkgname%-bin}"
        find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} +
        install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
