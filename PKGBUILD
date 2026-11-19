# Maintainer: devome <evinedeng@hotmail.com>

pkgbase="bentopdf"
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=2.8.12
pkgrel=1
pkgdesc="A powerful, privacy-first, client-side PDF toolkit that is self hostable and allows you to manipulate, edit, merge, and process PDF files directly in your browser."
arch=("any")
url="https://github.com/alam00000/${pkgname}"
license=("AGPL-3.0-only")
install="${pkgname}.install"
makedepends=("npm")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('95b0bbbc798e550d6ad0aa59182a50c3e6ae64b79a360cf5a6a8888a06507525')
options=(!strip)

prepare() {
    cd "${pkgname}-${pkgver}"
    npm ci --allow-remote=all
}

build() {
    cd "${pkgname}-${pkgver}"
    SIMPLE_MODE=true npm run build:with-docs
    find dist -type f -name "*.map" -delete
}

package_bentopdf() {
    optdepends=("${pkgbase}-docs: for documentation"
                "caddy: for serving bentopdf"
                "nginx: for serving bentopdf"
                "traefik: for serving bentopdf")
    cd "${pkgbase}-${pkgver}"
    install -Dm644 README.md nginx.conf -t "${pkgdir}/usr/share/doc/${pkgbase}"

    cd dist
    find . -path ./docs -prune -o -type f -exec install -Dm644 {} "${pkgdir}/usr/share/webapps/${pkgbase}/{}" \;
}

package_bentopdf-docs() {
    pkgdesc+=' (documentation)'

    cd "${pkgbase}-${pkgver}/dist"
    install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
    find docs -type f -exec install -Dm644 {} "${pkgdir}/usr/share/webapps/${pkgbase}/{}" \;
    ln -s "/usr/share/webapps/${pkgbase}/docs" "${pkgdir}/usr/share/doc/${pkgbase}/docs"
}
