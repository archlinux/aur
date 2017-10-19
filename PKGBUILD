# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
_file_id=721365
pkgname=firefox-passff
pkgver=1.0.3linux
pkgrel=1
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/passff/passff"
license=('GPL2')
groups=(firefox-addons)
depends=('firefox>=50')
makedepends=(unzip jq)
source=("https://github.com/passff/passff/archive/${pkgver}.tar.gz"
        "https://addons.mozilla.org/firefox/downloads/file/${_file_id}/${_pkgname}-${pkgver}-an+fx-linux.xpi")
noextract=("${_pkgname}-${pkgver}.xpi")
sha384sums=('ee1290bc1aabbbc2e538494f39604d1f1a3df9c865d41ae4bb1b8d9bf43015c43f88bd01479dfe02e51666983c247fe2'
            'dece476349a13587da49a8c51b7ec59944572dd584c251d30db6260d7d36dfe1326d9c5fa791d240ddad314230e635dd')

package() {
    cd "${_pkgname}-${pkgver}/src"

    local ext_id="$(jq -r .applications.gecko.id manifest.json)"

    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}-an+fx-linux.xpi" \
        "${pkgdir}/usr/lib/firefox/browser/extensions/${ext_id}.xpi"
    install -Dm755 host/passff.py \
        "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/passff.py"
    jq '.path = "/usr/lib/mozilla/native-messaging-hosts/passff.py"' host/passff.json \
        > "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/passff.json"
}
