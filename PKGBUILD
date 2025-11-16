# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT m>e
pkgname=zwave-js-server
pkgver=3.4.0
pkgrel=1
pkgdesc="Websocket server wrapper around Home Assistant's Z-Wave JS."
arch=('any')
url="https://github.com/zwave-js/zwave-js-server"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('jq' 'npm')
install="$pkgname.install"
source=("https://registry.npmjs.org/@zwave-js/server/-/server-$pkgver.tgz"
        "zwave-js-server@.service"
        "zwave-device.conf.example")
noextract=("server-$pkgver.tgz")
sha256sums=('0558308b24b9b56eb371219fff7eed6ecb63cbed788e98c9d48a0db05075f6c6'
            'ea0eed4794de59152a99178cf8800dc8dd2660f5bb034087571767ae0c04e243'
            '5c2162ebea47c41af8355345f4ed5d8fdc47d4d98a0919904cbb9d5c6ffe4f76')

package() {
    # install the main package
    npm install -g --prefix "$pkgdir/usr" "$srcdir/server-$pkgver.tgz"

    # systemd service
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "$pkgname@.service" "$pkgdir/usr/lib/systemd/system/"

    # configuration files and directories
    install -dm755 "$pkgdir/etc/conf.d/$pkgname"
    install -dm755 "$pkgdir/etc/$pkgname"
    install -Dm644 "zwave-device.conf.example" "$pkgdir/etc/conf.d/$pkgname"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@zwave-js/server/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
