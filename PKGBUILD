# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=before-dawn
pkgver=0.26.0
pkgrel=3
pkgdesc="A desktop screensaver app using web technologies"
arch=('any')
url="https://github.com/muffinista/before-dawn"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron26'
    'hicolor-icon-theme'
)
makedepends=(
    'npm'
    'gendesk'
    'nodejs>=18.16.1'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('15b46edeb6bf3021bb2f4928dad58f55c1aede54c43fba2272734ac9b6aa0003'
            '86743fe625d8342fb25bb53d69d611b255c09f9fffbf6ed84413116a494bd46d')
build() {
    gendesk -q -f -n --categories "Utility" --name "Before Dawn" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci
    sed '141,155d' -i package.json
    sed '124,139d' -i package.json
    sed "s|deb|AppImage|g" -i package.json
    npm run pack
    cd "${srcdir}/${pkgname}-${pkgver}/dist/.icon-set"
    cp icon_16x16.png icon_16.png
    cp icon_48x48.png icon_48.png
    cp icon_128x128.png icon_128.png
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}/"{output,data/savers}
    cp -r "${srcdir}/${pkgname}-${pkgver}/output/system-savers" "${pkgdir}/usr/lib/${pkgname}/output"
    cp -r "${srcdir}/${pkgname}-${pkgver}/output/system-savers" "${pkgdir}/usr/lib/${pkgname}/data/savers"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16 32 48 64 128 256 512 1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}