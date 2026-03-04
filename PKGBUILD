# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qqbrowser-bin
pkgver=21.0.0.100
pkgrel=1
pkgdesc="A browser that combines a minimal design with sophisticated technology to make the web faster, safer, and easier.(Prebuilt version)QQ浏览器"
arch=('x86_64')
url="https://browser.qq.com/"
license=('LicenseRef-custom')
depends=(
    'alsa-lib'
    'nspr'
    'nss'
    'at-spi2-core'
    'libxrandr'
    'libxcomposite'
    'libxdamage'
    'pango'
    'cairo'
    'mesa'
    'libxkbcommon'
    'libcups'
    'libunwind'
    'qt5-base'
    'qt6-base'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://pcchannel.imtt.qq.com/channel/${pkgname%-bin}-browser-stable_${pkgver}-1_amd64.deb"
    "LICENSE.html::https://browser.qq.com/license/"
)
sha256sums=('cb130d5fd81b92725c947fc3a450ee85cce9cc3f13aba4fe902200609b45a743'
            '0c1708f665e84ee7daab49d7eea1b13c375d2ecfc4aa10aae2088a0b41e30171')
prepare() {
    cd "${srcdir}"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=\/usr\/bin\/${pkgname%-bin}-browser-stable/Exec=${pkgname%-bin}/g
        s/Icon=${pkgname%-bin}-browser/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}-browser.desktop"
    find "${srcdir}" -type d -exec chmod 755 {} +
    chmod 4755 "${srcdir}/opt/tencent/${pkgname%-bin}/chrome-sandbox"
    sed -i "s/${pkgname%-bin}-browser.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/usr/share/appdata/${pkgname%-bin}-browser.appdata.xml"
    sed -i "s/opt\/tencent/usr\/lib/g" "${srcdir}/usr/share/gnome-control-center/default-apps/${pkgname%-bin}-browser.xml"
    sed -i "s/opt\/tencent/usr\/lib/g" "${srcdir}/usr/share/menu/${pkgname%-bin}-browser.menu"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -Pr --no-preserve=ownership "${srcdir}/opt/tencent/${pkgname%-bin}" "${pkgdir}/usr/lib"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}-browser" "${pkgdir}/usr/bin/${_pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-browser.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16 24 32 48 64 128 256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/opt/tencent/${pkgname%-bin}/product_logo_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/opt/tencent/${pkgname%-bin}/product_logo_32.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.xpm"
    install -Dm644 "${srcdir}/usr/share/menu/${pkgname%-bin}-browser.menu" "${pkgdir}/usr/share/menu/${pkgname%-bin}.menu"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${pkgname%-bin}-browser.xml" \
        "${pkgdir}/usr/share/gnome-control-center/default-apps/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/usr/share/appdata/${pkgname%-bin}-browser.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
