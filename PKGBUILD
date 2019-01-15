# Maintainer: Melissa Sproule <sprocklem@gmail.com>
_pkgname="overbitenx"
pkgname="firefox-extension-${_pkgname}"
pkgver='0.9.2.0'
pkgrel='3'
pkgdesc="Add gopher support to Firefox (beta)"
arch=('x86_64')
url="https://github.com/classilla/overbitenx"
license=('custom')
groups=('firefox-addons')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/classilla/overbitenx/archive/${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/1012346/${_pkgname}-0.1-an+fx-linux.xpi")
noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('bf3fa2cf5baaf8503d4ce15bae21071d10f3bd265937e1660765ae0e6f21f56c'
            '708dd95cd62be2d89e18a613254c4de7ed49d23532ca0b9f728f19ad3280be8e')

prepare() {
    cd "${_pkgname}-${pkgver}"
    sed "s|/home/linus/bin/onyx|/usr/lib/${_pkgname}/onyx|g" EXAMPLE_onyx.json >onyx.json
}

build() {
    cd "${_pkgname}-${pkgver}"

    # Since the onyx build rule is defined in Makefile.default, this should use the (superior)
    # implicit build rule and not redefine CC for some reason.
    make onyx
}

package() {
    install -Dm644 "${_pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/overbitenx@floodgap.com.xpi"
    install -Dm644 "${_pkgname}-${pkgver}/onyx.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/onyx.json"
    install -Dm755 "${_pkgname}-${pkgver}/onyx" "${pkgdir}/usr/lib/${_pkgname}/onyx"
    install -Dm644 "${_pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
