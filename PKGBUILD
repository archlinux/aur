# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="query-master"
pkgver=0.1.6
pkgrel=1
pkgdesc="Just another MySQL GUI client"
arch=('any')
url="https://github.com/invisal/query-master"
license=('MIT')
conflicts=("${pkgname}")
depends=('electron' 'hicolor-icon-theme')
makedepends=('yarn' 'npm' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('5067633c0a238e000e4873f0594833654b6ec931fdb70e7f5efc92753d7fc92d'
            '2ed3e18aa92ebd426c7330619d8a458bd4d31d64faebc5ee15c35cf34ea15c7e')
build() {
    cd "${srcdir}/${pkgname%-appimage}-${pkgver}"
    yarn install
    yarn package
}
package() {
    install -Dm0755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    gendesk -f -n --icon "${pkgname}" --categories "Development;Utility" --name "${pkgname}" --exec "${_install_path}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
}