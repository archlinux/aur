# Maintainer: devome <evinedeng@hotmail.com>

pkgname="bentopdf"
pkgver=2.8.4
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
sha256sums=('087feb96f52d48db74655392e9d42f2062381ba2f1a313e8909280c732f8114f')

build() {
    cd "${pkgname}-${pkgver}"
    npm ci
    SIMPLE_MODE=true npm run build:with-docs
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 README.md nginx.conf -t "${pkgdir}/usr/share/doc/${pkgname}"

    cd dist
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/webapps/${pkgname}/{}" \;
}
