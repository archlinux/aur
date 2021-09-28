# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Ben Silverman <bensilverman10 at gmail dot com>

pkgname=alacritty-themes
pkgver=4.1.2
pkgrel=3

pkgdesc="A utility for choosing and applying Alacritty terminal themes."
arch=(any)
url="https://github.com/rajasegar/alacritty-themes"
license=("MIT")

depends=("nodejs")
makedepends=("npm" "jq")
conflicts=("$pkgname")
install="$pkgname.install"

source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
	"fixing_v4.1.2.patch")
noextract=("${pkgname}-${pkgver}.tgz")
b2sums=('aac71402d02519b7921c8172f0218ee161bd1b3fb6343e497eed22407abf34623b0781bbbdadd687eae2e3861bfaab4c9ff6f09790145966e8349ddd643723d5'
	'SKIP')

# Document: https://wiki.archlinux.org/title/Node.js_package_guidelines
package() {
    npm install -g --cache "${srcdir}/npm-cache" --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    find "$pkgdir" -type f -name package.json | while read pkgjson; do
        local tmppackage="$(mktemp)"
        jq 'del(.man)' "$pkgjson" >"$tmppackage"
        mv "$tmppackage" "$pkgjson"
        chmod 644 "$pkgjson"
    done

    patch $pkgdir/usr/lib/node_modules/alacritty-themes/src/helpers/index.js -i fixing_v4.1.2.patch    
}
