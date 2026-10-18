# Maintainer: devome <evinedeng@hotmail.com>

pkgname="bentopdf"
pkgver=2.8.9
pkgrel=1
pkgdesc="A powerful, privacy-first, client-side PDF toolkit that is self hostable and allows you to manipulate, edit, merge, and process PDF files directly in your browser."
arch=("any")
url="https://github.com/alam00000/${pkgname}"
license=("AGPL-3.0-only")
install="${pkgname}.install"
makedepends=("npm")
optdepends=("caddy: for serving bentopdf"
            "nginx: for serving bentopdf"
            "traefik: for serving bentopdf")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e8bd1013f90908180a0bcf47d7e3742228e27fd033e803caba3aafa453aa4967')

prepare() {
    cd "${pkgname}-${pkgver}"
    npm ci --allow-remote=all
}

build() {
    cd "${pkgname}-${pkgver}"
    SIMPLE_MODE=true npm run build:with-docs
    find dist -type f -name "*.map" -delete
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 README.md nginx.conf -t "${pkgdir}/usr/share/doc/${pkgname}"

    cd dist
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/webapps/${pkgname}/{}" \;
    ln -s "/usr/share/webapps/${pkgname}/docs" "${pkgdir}/usr/share/doc/${pkgname}/docs"
}
