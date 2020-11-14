# Maintainer: Marek Darocha <aur@mdarocha.pl>
pkgname=elm-language-server
pkgver=1.13.2
pkgrel=1
epoch=0
pkgdesc="Language server for Elm Language, utilizing the Language Server Protocol"
arch=('any')
url="https://github.com/elm-tooling/elm-language-server"
license=('MIT')
depends=('elm-bin' 'nodejs')
makedepends=('npm' 'jq' 'git')
source=("https://registry.npmjs.org/@elm-tooling/elm-language-server/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('316794548fb29ec680d6be98b14b540e721ebde8f25010917f31d4511f515ab0')
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
