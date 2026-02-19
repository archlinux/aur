# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=claude-code-ui
_npmname=@siteboon/claude-code-ui
pkgver=1.18.2
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
sha256sums=('e46d591abbc63204934e4e5391564f4f8ffb54b2ba1c7b5865272cd925d7edbe')

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
