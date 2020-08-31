# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=deej
pkgver=0.9.10
pkgrel=1
pkgdesc='Open-source hardware volume mixer'
arch=('any')
url='http://deej.rocks/'
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk' 'hicolor-icon-theme')
makedepends=('go')
source=('LICENSE'
        "${pkgname}.desktop"
        "${pkgname}-${pkgver}::https://github.com/omriharel/deej/archive/v${pkgver}.tar.gz"
)
sha256sums=('8e64cfc2670d5a75ce040e0c2d581b22c6bb2c86cf7222152e14ee6569b94eef'
            'ef67ab46badeb9395e51747716792c0e1319e6e56d1850d7e10cc96a5c294f17'
            'f9a38e7188d9dcfd089e809fd0450075acd1a89acf22d76fa55134c1c5afd654'
)
install="${pkgname}.install"

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./scripts/linux/build-release.sh
}

package() {
    cd "$srcdir"

    # Copy License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create target directories
    install -dm777 "${pkgdir}/opt/${pkgname}/logs"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"

    # Copy application files
    install -Dm644 "${pkgname}-${pkgver}/assets/logo-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/deej.png"
    install -Dm666 "${pkgname}-${pkgver}/scripts/misc/default-config.yaml" "${pkgdir}/opt/${pkgname}/default-config.yaml"
    install -Dm755 "${pkgname}-${pkgver}/${pkgname}-release" "${pkgdir}/opt/${pkgname}/${pkgname}"

    # Install desktop file
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
