# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=deej-git
_appname=deej
pkgver=0.9.9
pkgrel=1
pkgdesc='Open-source hardware volume mixer'
arch=('any')
url='http://deej.rocks/'
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk')
makedepends=('go')
source=('LICENSE'
        "${_appname}.desktop"
        "${pkgname}-${pkgver}::https://github.com/omriharel/deej/archive/v${pkgver}.tar.gz"
)
sha256sums=('8e64cfc2670d5a75ce040e0c2d581b22c6bb2c86cf7222152e14ee6569b94eef'
            'ef67ab46badeb9395e51747716792c0e1319e6e56d1850d7e10cc96a5c294f17'
            '2e7f9e0c11dfe12706ada531507b48f0a9ae30d7a15b38c6b435ab7888b485ec'
)
install="${pkgname}.install"

build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    ./scripts/linux/build-release.sh
}

package() {
    cd "$srcdir"

    # Copy License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create target directories
    install -dm777 "${pkgdir}/opt/${_appname}/logs"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/512x512/apps"

    # Copy application files
    install -Dm644 "${_appname}-${pkgver}/assets/logo-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/deej.png"
    install -Dm666 "${_appname}-${pkgver}/scripts/misc/default-config.yaml" "${pkgdir}/opt/${_appname}/default-config.yaml"
    install -Dm755 "${_appname}-${pkgver}/${_appname}-release" "${pkgdir}/opt/${_appname}/${_appname}"

    # Install desktop file
    install -Dm644 "${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
}
