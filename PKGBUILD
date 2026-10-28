# Maintainer: Sergio Fernandez (GeiserX) <9169332+GeiserX@users.noreply.github.com>
# The CLI release (.github/workflows/aur.yml) sets pkgver and sha256sums and pushes
# this file with its .SRCINFO to ssh://aur@aur.archlinux.org/lynxprompt.git.
pkgname=lynxprompt
pkgver=2.1.42
pkgrel=1
pkgdesc='CLI for LynxPrompt - Generate, sync, and manage AI IDE configuration files (AGENTS.md, CLAUDE.md, .cursorrules, and more)'
arch=('any')
url='https://lynxprompt.com'
license=('AGPL-3.0-or-later')
depends=('nodejs>=18')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('0cf3a3817821599a42228c777b4934558900aecff0895c0aae0aae4010fa3e02')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix="${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Fix permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Remove references to pkgdir
    find "${pkgdir}" -name package.json -exec sed -i "s|${pkgdir}||g" {} +

    # Install license
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
