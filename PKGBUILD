# Maintainer: illusory <becomeillusory AT gmail DOT com>


pkgname=flclash-myflavor-bin
_pkgname=FlClash
pkgver=1.19.31
pkgrel=1
pkgdesc="Multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free, follows the mainline mihomo core updates. (Forked by myflavor)"
arch=('x86_64')
url="https://github.com/myflavor/FlClash"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")

depends=(
    'libayatana-appindicator'
    'ayatana-ido'
    'libdbusmenu-glib'
    'libkeybinder3'
)


source=(
    "${pkgname%-bin}.sh"
)


source_x86_64=(
    "${pkgname%-bin}-${pkgver}-x86_64.deb::https://gh-proxy.com/${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
)


sha256sums=('debddc0c8728bcbc552d0826ef0b5a4cd33e20df01752baa85e54498ec8ec3d5')
sha256sums_x86_64=('6c083bff90c3e0d56b9b71be0d2d53a7e5f103870cb383d38f1decfbec01f02e')

prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        5i\Categories=Network;
        10i\StartupWMClass=com.follow.clash
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
}
