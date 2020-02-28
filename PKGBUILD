# Maintainer: Leo_L <Leo dot Lahtinen at protonmail dot com>
pkgname=nodejs-tget
_npmname=t-get
pkgver=2.2.0
pkgrel=1
pkgdesc="Tget is wget for torrents"
url="https://github.com/jeffjose/tget"
license=('MIT')
arch=(any)
depends=('nodejs')
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
md5sums=('1e1a9c4023b8f11d82f186eeeecf2517')

package() {
    npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # Remove references to pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
