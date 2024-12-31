# Maintainer: Lynx <wostarxi@outlook.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nfs-browser-bin
_mainver=6.0.0
_subver=m26_1nfs5
pkgver="${_mainver}_${_subver}"
pkgrel=1
pkgdesc="方德安全浏览器"
arch=(
    'aarch64'
    'x86_64'
)
url="https://browser.nfschina.com/se.html"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'gtk3'
    'nss'
)
options=(
    '!emptydirs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://browser.nfschina.com/download/flavor/aarch64/latest/linux_64")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://browser.nfschina.com/download/flavor/x86_64/latest/linux_64")
sha256sums_aarch64=('fdd88d82bc0593d6cb1bf43852f2ee9ca11ddf460058f7d417de725b32da5aaf')
sha256sums_x86_64=('f21d96be6346b594d1fd9121bb20d2b4e235d62100a2281c6f5611a1f9ab950e')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/usr\/bin\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed -e "
        /executable/d
        s/\/usr\/bin\/${pkgname%-bin}/${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/gnome-control-center/default-apps/${pkgname%-bin}.xml"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(16 22 24 32 48 64 128 256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/opt/${pkgname%-bin}/icons/product_logo_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/gnome-control-center/default-apps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}