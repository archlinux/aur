# Maintainer Simone Cimarelli <aquilairreale@ymail.com>
# Contributor Peri Vance <perivance@posteo.net>

pkgname=unofficial-homestuck-collection
pkgver=2.5.7
pkgrel=2
pkgdesc="The Unofficial Homestuck Collection"
arch=('x86_64')
url='https://homestuck.github.io/'
license=('custom:chrome' 'custom:electron')
makedepends=('nodejs-lts-jod' 'gendesk' 'yarn' 'electron' 'python' 'python-setuptools')
source=("https://github.com/homestuck/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        node-engines.patch)
sha512sums=('53f66768e946ae909bfd60703a9a95f4832346de05af120ecbc76561719cc228655d272db32766320f77242490ab979c9a06cb58c829455db7addd2e559d98af'
            '4c232d99ed96caf0a2f11cdf583642a21014efdf8095460d6e8838bb367f7e89bbb6b2409b29fb250578fc61578c3b373dbd519821e43a714f3d282f3433986a')

prepare() {
    patch -d "$pkgname-$pkgver" -p1 < node-engines.patch

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
