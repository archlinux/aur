# Maintainer: Jasmin <jasmin@example.com>
pkgname=claude-code-ui
_npmname=@siteboon/claude-code-ui
pkgver=1.9.1
pkgrel=1
pkgdesc="Desktop and mobile UI for Claude Code - manage sessions and projects remotely"
arch=('any')
url="https://github.com/siteboon/claudecodeui"
license=('GPL-3.0-only')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/@siteboon/claude-code-ui/-/claude-code-ui-${pkgver}.tgz")
noextract=("claude-code-ui-${pkgver}.tgz")
sha256sums=('2ba75be7fba57e22017b3dd91d8bd1817e898bd1031b8d38d8bda01cfa161195')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" \
        "${srcdir}/claude-code-ui-${pkgver}.tgz"

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@siteboon/claude-code-ui/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
