# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=ripencli
pkgver=1.2.7
pkgrel=1
pkgdesc="Update npm, pnpm, yarn, and bun dependencies interactively from your terminal."
arch=('any')
url="https://ripencli.vercel.app/"
license=('MIT')
depends=(nodejs)
makedepends=(npm jq)
conflicts=('nodejs-ripencli')
provides=('nodejs-ripencli')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('712e8babd390b8490246898f76c9d46a4ed6239ef02ef3ea5d564025d9f7b015')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    local tmppackage="$(mktemp)"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
