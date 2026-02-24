# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=claude-code-ui
_npmname=@siteboon/claude-code-ui
pkgver=1.20.1
pkgrel=1
pkgdesc="Desktop and mobile UI for Claude Code - manage sessions and projects remotely"
arch=('any')
url="https://github.com/siteboon/claudecodeui"
license=('GPL-3.0-only')
depends=('nodejs')
makedepends=('npm' 'jq' 'python-setuptools')
options=('!strip')
source=("https://registry.npmjs.org/@siteboon/claude-code-ui/-/claude-code-ui-${pkgver}.tgz")
noextract=("claude-code-ui-${pkgver}.tgz")
sha256sums=('3a3fc371740573f23cc8ece5c8197860740e91fa2775aa054530a6d054b23860')

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
