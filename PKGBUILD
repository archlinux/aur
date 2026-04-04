# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=claude-code-ui
_npmname=@siteboon/claude-code-ui
pkgver=2.0.0
pkgrel=1
pkgdesc="Desktop and mobile UI for Claude Code - manage sessions and projects remotely"
arch=('x86_64')
url="https://github.com/siteboon/claudecodeui"
license=('GPL-3.0-only')
depends=('nodejs' 'python' 'python-setuptools')
makedepends=('npm' 'jq')
options=('!strip')
source=("https://registry.npmjs.org/@siteboon/claude-code-ui/-/claude-code-ui-${pkgver}.tgz")
noextract=("claude-code-ui-${pkgver}.tgz")
sha256sums=('26369ba8811ea2e5d616544373b444e43ff64768d84d010c1a4a64ab19d4bcbd')

package() {
    npm_config_production=true npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" --production \
        "${srcdir}/claude-code-ui-${pkgver}.tgz"

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    find "${pkgdir}/usr/lib/node_modules" -name "__pycache__" -type d -exec rm -rf {} +
    find "${pkgdir}/usr/lib/node_modules" -name "*.pyc" -type f -delete
    grep -rl '\$srcdir' "${pkgdir}/usr" 2>/dev/null | xargs -r rm -f
    grep -rl '\$pkgdir' "${pkgdir}/usr" 2>/dev/null | xargs -r rm -f

    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@siteboon/claude-code-ui/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
