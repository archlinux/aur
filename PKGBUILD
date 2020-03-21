# Maintainer: Leo_L <Leo dot Lahtinen at protonmail dot com>
pkgname=coronavirus-tracker-cli
pkgver=0.7.0
pkgrel=1
pkgdesc="Track The Coronavirus from your CLI"
url="https://github.com/sagarkarira/coronavirus-tracker-cli/"
license=('WTFPL')
arch=(any)
depends=('nodejs')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
md5sums=('b14675f03c5405d8dec816bc11917061')

package() {
    npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # Remove references to pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
