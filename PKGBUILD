# Maintainer: Silvan Gümüsdere <silvan@trollbox.org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=elasticdump
pkgver=6.97.0
pkgrel=1
pkgdesc="Import and export tools for Elasticsearch"
arch=(any)
url="https://github.com/taskrabbit/elasticsearch-dump"
license=("Apache")
depends=('nodejs>=8.0')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('a7ee53bc0484ebfa05ec4f9717f4c2acaa4528eb16872e790fa59920a0c60ad9')
noextract=("$pkgname-$pkgver.tgz")

package() {
    # Thanks jeremejevs and je-vv for the pointers on these!
    npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

    # Fix permissions
    find "$pkgdir"/usr -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    # Remove references to pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
