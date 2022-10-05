# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
pkgname=nodejs-emmet-ls
_pkgname=${pkgname#nodejs-}
pkgver=0.3.0
pkgrel=1
pkgdesc='Emmet support by LSP'
arch=('any')
url="https://www.npmjs.com/package/$_pkgname"
license=('MIT')
makedepends=('npm' 'jq')
depends=('nodejs')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
b2sums=('d14ec2de039da45f4cf7d8f648538a6578818076a22cc571eba2b072b3684e86ac33bd01c9f892703734cfda3c277e045b4a73f7b79cebfcd30c12819c36bfcb')
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
