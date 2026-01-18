# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=openchamber
_npmname=@openchamber/web
pkgver=1.5.2
pkgrel=1
pkgdesc="Desktop and web interface for OpenCode AI agent"
arch=('any')
url="https://github.com/btriapitsyn/openchamber"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/@openchamber/web/-/web-${pkgver}.tgz")
noextract=("web-${pkgver}.tgz")
sha256sums=('d4dfd57d088d8027c03d70e8b36d56e4c3ba42647bdc709a23af85ea64deec70')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" \
        "${srcdir}/web-${pkgver}.tgz"

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@openchamber/web/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
