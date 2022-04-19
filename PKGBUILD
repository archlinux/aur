# Maintainer Simone Cimarelli <aquilairreale@ymail.com>
# Contributor Peri Vance <perivance@posteo.net>

pkgname=unofficial-homestuck-collection
pkgver=2.0.5
pkgrel=2
pkgdesc="The Unofficial Homestuck Collection"
arch=('x86_64')
url="https://bambosh.github.io/unofficial-homestuck-collection/"
license=('custom:chrome' 'custom:electron')
depends=('libvips')
makedepends=('gendesk' 'yarn' 'electron')
source=("https://github.com/Bambosh/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('530f6aee01f53c92007f9b38d2d4e3587cc66ee5b27bb4684ff6503a602c5973451bd43210668f911733ae8921db4a5557ee5cdc3fc9a804e74cfa4e072a388f')

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
    SHARP_IGNORE_GLOBAL_LIBVIPS=true make publish
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
