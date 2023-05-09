# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=nodejs-emmet-ls
_pkgname=${pkgname#nodejs-}
pkgver=0.4.2
pkgrel=1
pkgdesc='Emmet support by LSP'
arch=('any')
url="https://www.npmjs.com/package/$_pkgname"
license=('MIT')
makedepends=('npm' 'jq')
depends=('nodejs')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
b2sums=('375c0ade058266d609234c4aeaee10754c993cebb76c81973fc83d9f5f84289f8a2fcf7be54f130199ee043a3bbf071b1aeba4b39be15584f701e04adf22ef10')
noextract=("$_pkgname-$pkgver.tgz")

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

    chown -R root:root "${pkgdir}"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    find "$pkgdir" -type f -name package.json | while read pkgjson; do
        local tmppackage="$(mktemp)"
        jq 'del(.man)' "$pkgjson" > "$tmppackage"
        mv "$tmppackage" "$pkgjson"
        chmod 644 "$pkgjson"
    done
}
