# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=ris-mcp-ts
pkgver=1.1.3
pkgrel=1
pkgdesc='MCP server for the Austrian Legal Information System (RIS)'
arch=('any')
url='https://github.com/Honeyfield-Org/ris-mcp-ts'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f4a2fa467efcf68e37e9b3a1076a5de27e9b063a4ed79ec768b1cdf528df3553')

prepare() {
    cd "${pkgname}-${pkgver}"
    npm install --ignore-scripts
}

build() {
    cd "${pkgname}-${pkgver}"
    npx tsc
}

package() {
    cd "${pkgname}-${pkgver}"
    npm prune --omit=dev --ignore-scripts
    find node_modules -type d -empty -delete

    local _destdir="${pkgdir}/usr/lib/${pkgname}"
    install -d "${_destdir}"
    cp -r dist node_modules package.json "${_destdir}/"

    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/dist/index.js" "${pkgdir}/usr/bin/${pkgname}"
    chmod 755 "${_destdir}/dist/index.js"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

latestver() {
    gh api --paginate repos/Honeyfield-Org/ris-mcp-ts/tags --jq '.[].name' |
        sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}
