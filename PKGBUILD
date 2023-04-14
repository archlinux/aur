# Maintainer: zer0-x < Matrix: "@zer0-x:kde.org" >
# Contributor: xuhcc <xuhcc at cryptolab dot net>

pkgname=mermaid-cli-brave
pkgver=10.1.0
pkgrel=1
pkgdesc="CLI for mermaid, generates diagrams and flowcharts (depends on brave rather then chromium)"
arch=("any")
url="https://github.com/mermaid-js/mermaid-cli"
license=("MIT")
depends=("nodejs" "brave")
makedepends=("npm" "brave")
conflicts=(${pkgname%-brave})
_npmscope=@mermaid-js
_npmname=mermaid-cli
_npmver=$pkgver
source=("http://registry.npmjs.org/${_npmscope}/${_npmname}/-/${_npmname}-${_npmver}.tgz")
sha256sums=("743d724d1d66a40b3c278495b11cf0645dd54b7a12897f7a0f39d5b4ce4305d5")
noextract=("${_npmname}-${_npmver}.tgz")

package() {
    # https://github.com/mermaid-js/mermaid-cli/blob/1a04781c5a9a6ceff8ad3c126db736ac9f6ba8c4/docs/already-installed-chromium.md
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true npm install --global --omit dev --prefix "${pkgdir}/usr" "${_npmname}-${_npmver}.tgz"
    sed -i "s#let puppeteerConfig = {}#let puppeteerConfig = { product: 'chrome', executablePath: '$(which brave)' }#g" "${pkgdir}/usr/lib/node_modules/@mermaid-js/mermaid-cli/src/index.js"

    # -> https://wiki.archlinux.org/index.php/Node.js_package_guidelines
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
