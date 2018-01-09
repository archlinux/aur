# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
_file_id=829999
pkgname=firefox-passff
pkgver=1.1
pkgrel=1
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/passff/passff"
license=('GPL2')
groups=(firefox-addons)
depends=('firefox>=50' 'python' 'pass')
makedepends=(jq)
source=("https://github.com/passff/passff/archive/${pkgver}.tar.gz"
        "https://addons.mozilla.org/firefox/downloads/file/${_file_id}/${_pkgname}-${pkgver}-an+fx-linux.xpi")
noextract=("${_pkgname}-${pkgver}-an+fx-linux.xpi")
sha384sums=('8e75bb14227cd86a447cfe9c680681072390b9c5eba4fe8184085b45a2606affbe253861ec309b62318dc1cdfb6d1094'
            '191d3a88ffa7dcec7448950592a8d2e82c72630f218da56447a281b8b7fe384a96c57c5e0db3618f76c59c852c5cabaa')

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
