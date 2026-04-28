# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=shopify-cli
_npmname=@shopify/cli
pkgver=3.94.2
pkgrel=1
pkgdesc="A CLI tool to build for the Shopify platform"
arch=('x86_64')
url="https://github.com/Shopify/cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/@shopify/cli/-/cli-${pkgver}.tgz")
noextract=("cli-${pkgver}.tgz")
sha256sums=('22fc26304ebe1f03a4da694b92001769ccd26ec56503db553ac796a543393504')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" \
        "${srcdir}/cli-${pkgver}.tgz"

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@shopify/cli/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    license_files=( "$pkgdir/usr/lib/node_modules/@shopify/cli/LICENSE" "$pkgdir/usr/lib/node_modules/@shopify/cli/license" "$pkgdir/usr/lib/node_modules/@shopify/cli/LICENSE.md" )
    for lf in "${license_files[@]}"; do
      if [ -f "$lf" ]; then
        install -Dm644 "$lf" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
        break
      fi
    done
}
