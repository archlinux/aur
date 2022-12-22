# Maintainer : Hauke Ingwersen <hauing@pm.me>
# Contributor : Marek Darocha <aur@mdarocha.pl>

pkgname=elm-language-server
pkgver=2.6.0
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
sha256sums=('581e6e88ad12bf97e0c7c663a3851ec4cfb9937a2fe8a747fbfe58670364d296')
options=(!strip)

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@elm-tooling/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"

    chown -R root:root "${pkgdir}"
}
