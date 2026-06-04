# Maintainer: illusory <becomeillusory AT gmail DOT com>


pkgname=flclash-myflavor-bin
_pkgname=FlClash
pkgver=1.19.26
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
    "${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
)


sha256sums=('debddc0c8728bcbc552d0826ef0b5a4cd33e20df01752baa85e54498ec8ec3d5')
sha256sums_x86_64=('4de5ba5a0cca188e1c649829c893072dc2ca2748d7ae1917b8a3bee14d7a33e8')

prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    
    bsdtar -xf "${srcdir}/data.tar."*
    
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        /\[Desktop Entry\]/a Categories=Network;
        /Categories=/a StartupWMClass=flclash
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    
    
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    
    cd "${srcdir}/usr/share/icons/hicolor"
    for size in *; do
        if [ -f "${size}/apps/${_pkgname}.png" ]; then
            install -Dm644 "${size}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname%-bin}.png"
        fi
    done
}
