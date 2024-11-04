# Maintainer: xuhcc <xuhcc at cryptolab dot net>

pkgname=mermaid-cli
pkgver=11.4.0
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
sha256sums=('5fd166578bfbc5eaa41ea4f39062560d6f9ee49bb9e0296b3b31547ba8c512af')
noextract=("${_npmname}-${_npmver}.tgz")

package() {
    # https://github.com/mermaid-js/mermaid-cli/blob/11.1.1/docs/already-installed-chromium.md
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true PUPPETEER_SKIP_DOWNLOAD=1 npm install --global --omit dev --prefix "${pkgdir}/usr" "${_npmname}-${_npmver}.tgz"
    sed -i "s# headless: 'shell'# headless: 'shell', executablePath: '$(which chromium)'#g" "${pkgdir}/usr/lib/node_modules/@mermaid-js/mermaid-cli/src/index.js"

    # -> https://wiki.archlinux.org/index.php/Node.js_package_guidelines
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
