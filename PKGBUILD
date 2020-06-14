# Maintainer: Felix Golatofski <contact@xdfr.de>


_npmname=markserv
pkgname=nodejs-$_npmname
pkgver=1.17.4
pkgrel=1
pkgdesc="Markserv serves Markdown files as GitHub style HTML and LiveReloads your files in the browser as you edit."
arch=(any)
url="https://github.com/f1lt3r/markserv"
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)

noextract=($_npmname-$pkgver.tgz)
sha256sums=('7f9564290f461cdf131354f70b9fa9e79e7f1c4b306c0f3273de69d2d946d029')

package() {
    npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

    # Fix permissions
    find "$pkgdir"/usr -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    # Remove references to pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
