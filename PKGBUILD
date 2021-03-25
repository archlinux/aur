# Maintainer: Marek Darocha <aur@mdarocha.pl>
pkgname=elm-language-server
pkgver=2.1.0
pkgrel=1
epoch=0
pkgdesc="Language server for Elm Language, utilizing the Language Server Protocol"
arch=('any')
url="https://github.com/elm-tooling/elm-language-server"
license=('MIT')
depends=('nodejs>10.0.0')
optdepends=('elm-bin: required to work, if not installed with other means (like npm)')
makedepends=('npm' 'jq' 'git')
source=("https://registry.npmjs.org/@elm-tooling/elm-language-server/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('1396d692260694b3cb2d4d9f080b03371356157b65daed50c246ad574fc451a0')
options=(!strip)

package() {
    npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
    find "$pkgdir/usr" -type d -exec chmod 755 {} +

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@elm-tooling/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
