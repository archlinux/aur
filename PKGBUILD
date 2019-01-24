# Maintainer: jit26@protonmail.com
pkgname=8bit-league
pkgver=1.0.0
pkgrel=1
pkgdesc="League of Legends client in your terminal"
arch=(any)
url="https://github.com/molenzwiebel/8bit-league"
license=('MIT')
depends=('nodejs')
makedepends=('jq' 'npm')
optdepends=()
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('38f1ead691f69247ce0914efcb2bb339aef0b27ec97cb904990139c40e01d25b')

package() {
    npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

    # Permissions
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # Remove references to pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    cd "$srcdir/package"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
