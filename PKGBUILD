# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=ripencli
pkgver=1.4.6
pkgrel=1
pkgdesc="Update npm, pnpm, yarn, and bun dependencies interactively from your terminal."
arch=('any')
url="https://ripencli.vercel.app/"
license=('LGPL-2.1-or-later')
depends=(nodejs)
makedepends=(npm jq)
conflicts=('nodejs-ripencli')
provides=('nodejs-ripencli')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('9415dac866e38a7e5b7c662ad64ab22c78143ce483256a952da7a3fa1a96df1b')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    local tmppackage="$(mktemp)"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
