# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
_npmname=@gridsome/cli
pkgname=gridsome-cli
pkgver=0.3.3
pkgrel=1
pkgdesc="A command line tool for creating new Gridsome projects."
arch=(any)
url="https://github.com/gridsome/gridsome/tree/master/packages/cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
provides=('gridsome')
source=("https://registry.npmjs.org/$_npmname/-/cli-$pkgver.tgz")
md5sums=('da324a21eebd8dbdf8dff71a3753b559')

package() {
    npm install -g --cache $srcdir/npm-cache --user root --prefix $pkgdir/usr $srcdir/cli-$pkgver.tgz
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
    chown -R root:root "$pkgdir"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # Install license file
    mkdir -p "$pkgdir/usr/share/licenses/$pkgdir"
    mv "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgdir/LICENSE"
}
