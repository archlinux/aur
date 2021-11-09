# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Ben Silverman <bensilverman10 at gmail dot com>

pkgname=alacritty-themes
pkgver=4.1.4
pkgrel=1

pkgdesc="A utility for choosing and applying Alacritty terminal themes."
arch=(any)
url="https://github.com/rajasegar/alacritty-themes"
license=("MIT")

depends=("nodejs")
makedepends=("npm" "jq")
conflicts=("$pkgname")
install="$pkgname.install"

source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
b2sums=('980d27c2d9349c246acf73a56e7e07e13e5581aa54291747cf1b9ad4ca26e47862c3022c3ac0bed4b9cddf53fb5f96e1c45f4df076147d73db195c64c4cc2c35')

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
}
