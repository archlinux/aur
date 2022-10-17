# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=nodejs-emmet-ls
_pkgname=${pkgname#nodejs-}
pkgver=0.3.1
pkgrel=1
pkgdesc='Emmet support by LSP'
arch=('any')
url="https://www.npmjs.com/package/$_pkgname"
license=('MIT')
makedepends=('npm' 'jq')
depends=('nodejs')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
b2sums=('54993e3833fd50a7a1298cdb4b617e8f31582e3d6069c4f3dd0c3e0c12d9c7fb305ceb66428952d49ae05fe56f40f68847f3c50b7eb8ae1a45da0a90aa9fea6d')
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
