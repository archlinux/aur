# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
_pkgname=compose-language-service
pkgname="nodejs-$_pkgname"
pkgver=0.2.0
pkgrel=1
pkgdesc='Language service for Docker Compose documents'
arch=('any')
url='https://github.com/microsoft/compose-language-service'
license=('MIT')
makedepends=('npm' 'jq')
depends=('nodejs')
source=("https://registry.npmjs.org/@microsoft/$_pkgname/-/$_pkgname-$pkgver.tgz")
b2sums=('a6f813a9d69746567f5de6bae40cd06906e4f8c62442b5ad60b4603a6a1d391b9796c03950f18e4c3234c6141924858e02d5f0f47fa5a36cb5637434b176c0dd')
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
