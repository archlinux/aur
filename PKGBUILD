# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT m>e
pkgname=zwave-js-server
pkgver=1.26.0
pkgrel=1
pkgdesc="Websocket server wrapper around Home Assistant's Z-Wave JS."
arch=('any')
url="https://github.com/zwave-js/zwave-js-server"
license=('unknown')
depends=('nodejs')
makedepends=('jq' 'npm')
source=("https://registry.npmjs.org/@zwave-js/server/-/server-$pkgver.tgz"
        "zwave-js-server@.service")
noextract=("server-$pkgver.tgz")
sha256sums=('5be6b09f0b701b981d28e5476144d13c6476c8da5b15b3562e3700e3ba601d55'
	    'fe06a8ecc75ee009dfeb6b99402f0cee434f6ead2ef21773024928d8132e3df2')

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/server-$pkgver.tgz"

    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "$pkgname@.service" "$pkgdir/usr/lib/systemd/system/"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@zwave-js/server/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
