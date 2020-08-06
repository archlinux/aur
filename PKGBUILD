# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>
pkgname=observatory-cli
pkgver=0.7.1
pkgrel=1
pkgdesc="Score your site's HTTPS practices"
arch=('any')
url="https://github.com/mozilla/observatory-cli"
license=('custom:MPL2')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/observatory-cli/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('219a8eed782ecf40a580fc9ee6485a34b443c4461d6bf2ee516757cbfdc0eb39')

package() {
    npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
