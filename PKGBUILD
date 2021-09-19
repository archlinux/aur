# Maintainer:  zoorat <zoorat [at] protonmail [dot] com>
# Contributor: Ben Silverman <bensilverman10 at gmail dot com>

pkgname=alacritty-themes
pkgver=4.1.1
pkgrel=2

pkgdesc="A cross-platform GPU-accelerated Terminal emulator."
arch=(any)
url="https://github.com/rajasegar/alacritty-themes"
license=("MIT")

depends=("nodejs")
makedepends=("npm" "jq")
conflicts=("$pkgname")
replaces=("$pkgname")
install="$pkgname.install"

source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
b2sums=('2dd1247ab59f5af74436b8643dedf5b679b063a869d6c70e1925f76aa856c907d77452f179ff5c810e6c8b46bc911da0833a8e63c8849d98a25681cc1f64bcc7')

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
