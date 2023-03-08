# Maintainer: xuhcc <xuhcc at cryptolab dot net>

pkgname=mermaid-cli
pkgver=10.0.2
pkgrel=1
pkgdesc='Generation of diagram and flowchart from text in a similar manner as markdown (CLI)'
arch=('any')
url='https://github.com/mermaid-js/mermaid-cli'
license=('MIT')
depends=('nodejs' 'chromium')
makedepends=('npm' 'chromium')
_npmscope=@mermaid-js
_npmname=mermaid-cli
_npmver=$pkgver
source=("http://registry.npmjs.org/${_npmscope}/${_npmname}/-/${_npmname}-${_npmver}.tgz")
sha256sums=('6fad020d0556de3d1e1edafeaa9e3e2ef0dfc107fa8285f10f6d325f5801b52f')
noextract=("${_npmname}-${_npmver}.tgz")

package() {
    # https://github.com/mermaid-js/mermaid-cli/blob/1a04781c5a9a6ceff8ad3c126db736ac9f6ba8c4/docs/already-installed-chromium.md
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true npm install --global --omit dev --prefix "${pkgdir}/usr" "${_npmname}-${_npmver}.tgz"
    sed -i "s#let puppeteerConfig = {}#let puppeteerConfig = { executablePath: '$(which chromium)' }#g" "${pkgdir}/usr/lib/node_modules/@mermaid-js/mermaid-cli/src/index.js"

    # -> https://wiki.archlinux.org/index.php/Node.js_package_guidelines
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
