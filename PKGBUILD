# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
_pkgname=compose-language-service
pkgname="nodejs-$_pkgname"
pkgver=0.3.0
pkgrel=1
pkgdesc='Language service for Docker Compose documents'
arch=('any')
url='https://github.com/microsoft/compose-language-service'
license=('MIT')
makedepends=('npm' 'jq')
depends=('nodejs')
source=("https://registry.npmjs.org/@microsoft/$_pkgname/-/$_pkgname-$pkgver.tgz")
b2sums=('e27429faa82c9009257279338058f88ad9afca4262fe6246a087f71eac90a2d0f0b4dddb1bbf1852d55fa6847599b37d5a82706fb449b52ed71e1666d8b383f9')
noextract=("$_pkgname-$pkgver.tgz")

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

    chown -R root:root "${pkgdir}"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@microsoft/$_pkgname/package.json"
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
