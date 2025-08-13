# Maintainer Simone Cimarelli <aquilairreale@ymail.com>
# Contributor Peri Vance <perivance@posteo.net>

pkgname=unofficial-homestuck-collection
pkgver=2.7.0
pkgrel=1
pkgdesc="The Unofficial Homestuck Collection"
arch=('x86_64')
url='https://homestuck.giovanh.com/unofficial-homestuck-collection/'
license=('GPL-3.0+' 'custom:chrome' 'custom:electron')
makedepends=('nodejs-lts-jod' 'gendesk' 'yarn' 'electron' 'python' 'python-setuptools' 'git')
depends=('libxcrypt-compat')
source=("git+https://github.com/GiovanH/${pkgname}.git#tag=v2.7.0"
        node-engines.patch)
sha512sums=('9dff8d1f8d5e9cc7e86caa8a7f63c2a8749bf78d8c6c8487d773c1fc117db808dd9eb10d3c20856d2cddf01efe7e14d28c993a46e43302a68669c86a93ee5712'
            'd93caf075f89184fb88e39e5faa7aa136817737e90da063ed98a15b668efacbb5b25415933a49669d76bee27eb1f871225c59333828a398ed4044b05bee0758d')

prepare() {
    patch -d "$pkgname" -p1 < node-engines.patch

    gendesk -f \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --name="Unofficial Homestuck Collection" \
        --categories "Game" \
        --exec="/usr/bin/unofficial-homestuck-collection"
}

build() {
    cd "${pkgname}"
    yarn install
    SHARP_IGNORE_GLOBAL_LIBVIPS=true make build
}

package() {
    mkdir -p "${pkgdir}/opt/"
    cp -r "${srcdir}/${pkgname}/dist_electron/linux-unpacked/" \
        "${pkgdir}/opt/${pkgname}/"

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/${pkgname}/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    ln -s "/opt/${pkgname}/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"

    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"

    mkdir -p "${pkgdir}/usr/share/applications/"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
