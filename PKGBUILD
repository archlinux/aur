# Maintainer: Luke Arms <luke@arms.to>

pkgname=prettier-plugin-php
pkgver=0.22.1
pkgrel=1
pkgdesc="Prettier PHP Plugin"
arch=("any")
url="https://github.com/prettier/prettier-php#readme"
license=("MIT")
depends=("prettier" "nodejs")
makedepends=("npm" "jq")
source=("https://registry.npmjs.org/@${pkgname%%-*}/${pkgname#*-}/-/${pkgname#*-}-$pkgver.tgz")
noextract=("${pkgname#*-}-$pkgver.tgz")
sha256sums=('f17c541e3239698fea8d9dae8691ae12313f9edd41eab5fa16d3ededb7f84368')

package() {
    npm install -g --prefix "$pkgdir/usr" --no-bin-links \
        "$srcdir/${pkgname#*-}-$pkgver.tgz"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "../../../lib/node_modules/@${pkgname%%-*}/${pkgname#*-}/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/"

    # `local json tempjson` is unnecessary because commands in pipelines are
    # executed in their own subshells
    local mainjson=$pkgdir/usr/lib/node_modules/@${pkgname%%-*}/${pkgname#*-}/package.json
    find "$pkgdir/usr" -type f -name package.json -print0 |
        while read -rd '' json; do
            tempjson=$(mktemp)
            if [ "$json" = "$mainjson" ]; then
                jq 'with_entries(select(.key | test("^_.+") | not))' \
                    "$json" >"$tempjson"
            else
                jq 'del(._where,.man)' \
                    "$json" >"$tempjson"
            fi
            cp "$tempjson" "$json"
        done

    # See https://github.com/npm/npm/issues/9359
    find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

    # See https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
