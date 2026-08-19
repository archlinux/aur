# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=exa-mcp-server
pkgver=3.4.1
pkgrel=1
pkgdesc="MCP server exposing Exa web search and web crawling tools"
arch=('any')
url="https://exa.ai/docs/reference/exa-mcp"
license=('MIT')
depends=('nodejs')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('62379fab5750cbc8334f096ff986ab1b7152488afffab5b0e275995310b6e978')

latestver() {
    curl -fsSL "https://registry.npmjs.org/${pkgname}/latest" | jq -r '.version'
}

package() {
    cd "${srcdir}/package"

    # Self-contained esbuild bundle shipped prebuilt in the npm tarball
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -a dist skills "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 package.json "${pkgdir}/usr/lib/${pkgname}/package.json"
    install -Dm644 README.md "${pkgdir}/usr/lib/${pkgname}/README.md"

    # Normalize permissions of upstream data files (cp preserves 0755 from tarball)
    find "${pkgdir}/usr/lib/${pkgname}" -type f ! -name 'stdio.cjs' -exec chmod 644 {} +

    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/dist/stdio.cjs" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
