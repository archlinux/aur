# Maintainer: devome <evinedeng@hotmail.com>

pkgname="bentopdf"
pkgver=2.8.11
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
sha256sums=('4218b8e6c429708f816fc78a01cb02ebded7274ea841176cdc3eec8b4d30c056')

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
