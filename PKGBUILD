# Maintainer: Afnan Enayet <afnan at afnan dot io>
pkgname=paperspace-node
pkgver=0.1.17
pkgrel=1
pkgdesc="The Paperspace API is the official devkit for automating your Paperspace account"
arch=("any")
url="https://github.com/Paperspace/paperspace-node"
license=("MIT")
depends=("nodejs")
makedepends=("npm")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Paperspace/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3cdd31cc242ac7f260388d64076f37197203cd075a81f0f321d1c2f8523db9fd')

build() {
    cd "$pkgname-$pkgver"
}

package() {
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tar.gz
        find "${pkgdir}"/usr -type d -exec chmod 755 {} +
        local tmppackage="$(mktemp)"
        local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
        jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
        mv "$tmppackage" "$pkgjson"
        chmod 644 "$pkgjson"
        install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE.txt"
}
