# Maintainer Simone Cimarelli <aquilairreale@ymail.com>
# Contributor Peri Vance <perivance@posteo.net>

pkgname=unofficial-homestuck-collection
pkgver=2.5.6
pkgrel=1
pkgdesc="The Unofficial Homestuck Collection"
arch=('x86_64')
url="https://bambosh.github.io/unofficial-homestuck-collection/"
license=('custom:chrome' 'custom:electron')
makedepends=('nodejs-lts-hydrogen' 'gendesk' 'yarn' 'electron')
source=("https://github.com/Bambosh/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('49e890a5fb0cf30653aff7f6e136fa1c3f46bc6ad92f70133727efd82530e1a75ac18121d090fae9b457ffc9a11807498450ad69b4045726ddaa1ef7e80fffce')

prepare() {
    gendesk -f \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --name="Unofficial Homestuck Collection" \
        --categories "Game;" \
        --exec="/usr/bin/unofficial-homestuck-collection"
}

build() {
    cd "${pkgname}-${pkgver}"
    SHARP_IGNORE_GLOBAL_LIBVIPS=true make build
}

package() {
    mkdir -p "${pkgdir}/opt/"
    cp -r "${srcdir}/unofficial-homestuck-collection-${pkgver}/dist_electron/linux-unpacked/" \
        "${pkgdir}/opt/unofficial-homestuck-collection/"

    mkdir -p "${pkgdir}/usr/share/licenses/unofficial-homestuck-collection/"
    ln -s "/opt/unofficial-homestuck-collection/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/unofficial-homestuck-collection/LICENSES.chromium.html"
    ln -s "/opt/unofficial-homestuck-collection/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/unofficial-homestuck-collection/LICENSE.electron.txt"

    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/opt/unofficial-homestuck-collection/unofficial-homestuck-collection" \
        "${pkgdir}/usr/bin/unofficial-homestuck-collection"

    mkdir -p "${pkgdir}/usr/share/applications/"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
