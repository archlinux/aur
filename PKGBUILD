# Maintainer: Sergio Fernandez (GeiserX) <9169332+GeiserX@users.noreply.github.com>
# The CLI release (.github/workflows/aur.yml) sets pkgver and sha256sums and pushes
# this file with its .SRCINFO to ssh://aur@aur.archlinux.org/lynxprompt.git.
pkgname=lynxprompt
pkgver=3.3.1
pkgrel=1
pkgdesc='CLI for LynxPrompt - Generate, sync, and manage AI IDE configuration files (AGENTS.md, CLAUDE.md, .cursorrules, and more)'
arch=('any')
url='https://lynxprompt.geiser.cloud'
license=('AGPL-3.0-or-later')
depends=('nodejs>=18')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('d8d50e4a6aa049af6ce9ae704becd13bee0d656642930066f9f3322dbe3927eb')
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
