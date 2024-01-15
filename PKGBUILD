# Maintainer: Maeve Sproule <sprocklem@gmail.com>
_pkgname="overbitenx"
pkgname="firefox-extension-${_pkgname}"
pkgver='0.9.2.1'
pkgrel='1'
pkgdesc="Add gopher support to Firefox (beta)"
arch=('x86_64')
url="https://github.com/classilla/overbitenx"
license=('custom')
groups=('firefox-addons')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/classilla/overbitenx/archive/${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/1731666/${_pkgname}-0.2-fx.xpi")
noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('c9e121c4a8edbb64c01f8e4d38fb8f24d11d838fbfd4db925eac5784bf8a823a'
            'ad35b96f9001c51fcee16fe8a206ec4c0312b088d3a4ba0f62c33afe9eeebdd0')

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
