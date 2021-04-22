# Maintainer: Simone Cimarelli <aquilairreale@ymail.com>

pkgname=unofficial-homestuck-collection
pkgver=1.1.0
pkgrel=1
pkgdesc="The Unofficial Homestuck Collection"
arch=('x86_64')
url="https://bambosh.github.io/unofficial-homestuck-collection/"
license=('custom:chrome' 'custom:electron')
makedepends=('gendesk' 'yarn' 'electron')
source=("https://github.com/Bambosh/${pkgname}/archive/refs/tags/V${pkgver}.tar.gz")
sha512sums=('a9c5a9830f9e69402734d67ca9718776a45d6fdad8d512a056bb7b2f70d0e2286f21fcd49a95bec3694e29250c3b837e4ab60e27da1b8bbebb3b8a04ca351325')

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
    yarn install
    yarn electron:build --dir
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
