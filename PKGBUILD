# Author: Lukas Grossar <lukas.grossar@gmail.com
# Maintainer: Lukas Grossar <lukas.grossar@gmail.com
_npmname=cz-conventional-changelog
pkgname=nodejs-cz-conventional-changelog
pkgver=3.1.0
pkgrel=1
pkgdesc="Commitizen plugin for conventional changelogs commit messages"
arch=(any)
url="https://github.com/commitizen/cz-conventional-changelog"
license=(MIT)
depends=('nodejs>=10' 'nodejs-commitizen')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=('482c0f3ce17eeea321d43664261af06b10af6733dacf613d070433719c01b879697098fdcf3cfb2b9bc00d04611eec52b5a1d91522db0e564475c96ce1b2aeed')

package() {
    npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
    chmod u=rwX,go=rX,go-w -R "$pkgdir/usr/lib/node_modules/$_npmname"
}
