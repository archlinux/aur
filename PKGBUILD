# Maintainer: A Farzat <a@farzat.xyz>

_pkgname=remark-language-server
pkgname="$_pkgname"
pkgver=2.0.0
pkgrel=1
pkgdesc="A language server to lint and format markdown files with remark."
arch=('any')
url="https://www.npmjs.com/package/$_pkgname"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz"
        https://github.com/remarkjs/remark-language-server/raw/main/license)
noextract=("$_pkgname-$pkgver.tgz")
sha256sums=('bbcbfbd25769df496df0091ca012cba146f490c17f120289cdb5b69046a87b84'
            '5678151a96d1ec6e160f86852149bb5cbc018b76b87ce70b40a3339722abab46')

package() {
    npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    chown -R root:root "$pkgdir"

    install -Dm644 "$srcdir/license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
