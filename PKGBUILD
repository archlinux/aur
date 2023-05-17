# Maintainer Simone Cimarelli <aquilairreale@ymail.com>
# Contributor Peri Vance <perivance@posteo.net>

pkgname=unofficial-homestuck-collection
pkgver=2.0.7
pkgrel=1
pkgdesc="The Unofficial Homestuck Collection"
arch=('x86_64')
url="https://bambosh.github.io/unofficial-homestuck-collection/"
license=('custom:chrome' 'custom:electron')
depends=('libvips')
makedepends=('nodejs-lts-fermium' 'gendesk' 'yarn' 'electron')
source=("https://github.com/Bambosh/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('79dd52c709c56a385fecc1d64a700208bab752140201edfd0d4a1c0054e59f252ea2310bc31e26027204629277ecfa1387f6573669c59faed5ac728d25924b7f')

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
    make build
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
