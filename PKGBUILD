# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=ccstatusline
pkgver=2.2.2
pkgrel=1
pkgdesc="Highly customizable status line formatter for Claude Code CLI with Powerline support"
arch=('any')
url="https://github.com/sirmalloc/ccstatusline"
license=('MIT')
depends=('nodejs')
provides=('node')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('35c85c5d8378a7143f555cb883d995bcf15c2d93317af06e7de69a343bba54fe')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    if [ -f "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" ]; then
        cp "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
    else
        for f in "$pkgdir"/usr/lib/node_modules/"$pkgname"/LICENSE* "$pkgdir"/usr/lib/node_modules/"$pkgname"/license*; do
            [ -e "$f" ] && cp "$f" "$pkgdir/usr/share/licenses/$pkgname/" && break
        done
    fi
}
