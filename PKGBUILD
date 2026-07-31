# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=ripencli
pkgver=1.3.2
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
sha256sums=('b840de8215f2de26f4f3b76396e34c82076ce88d73bd5838aaa17b5cc4b99f45')

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
