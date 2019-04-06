# Maintainer: Afnan Enayet <afnan at afnan dot io>
pkgname=paperspace-node
pkgver=0.1.14
pkgrel=1
pkgdesc="The Paperspace API is the official devkit for automating your Paperspace account"
arch=("any")
url="https://github.com/Paperspace/paperspace-node"
license=("MIT")
depends=("nodejs")
makedepends=("npm")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Paperspace/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('79fb9e74182c49209868cf587a19debbeee0ca4fa0affb38b7015a24eda64c0d')

build() {
	cd "$pkgname-$pkgver"
    npm audit fix
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
