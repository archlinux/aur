# Maintainer: Yakov Till <yakov.till@gmail.com>

_npmname=eslint-plugin-security
pkgname=nodejs-$_npmname
pkgver=4.0.1
pkgrel=1
pkgdesc="ESLint rules for Node Security"
arch=('any')
url="https://github.com/eslint-community/eslint-plugin-security"
license=('Apache-2.0')
depends=('nodejs' 'eslint')
makedepends=('jq' 'npm')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('9a9bc0ad60bfaa9f3db542d9e73ecbc854b52e567186f5b1fd9bd1eeedbc02e2')

latestver() {
    curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" | jq -r '.version'
}

package() {
    export npm_config_cache="$srcdir/npm_cache"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/${pkgname}-${pkgver}.tgz"

    install -Dm644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
    local tmpjson="$(mktemp)"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmpjson"
    mv "$tmpjson" "$pkgjson"
    chmod 644 "$pkgjson"
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
    chown -R root:root "$pkgdir/usr"
}
