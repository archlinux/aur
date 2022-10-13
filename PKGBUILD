# Maintainer: Narthana Epa <narthana.epa@gmail.com>

pkgname=nodejs-jwt-cli
_pkgname=${pkgname#nodejs-}
pkgver=2.0.0
pkgrel=1
pkgdesc="An npm package for decoding JSON Web Tokens (JWT) in a cli"
arch=(any)
url="https://github.com/troyharvey/jwt-cli"
license=("MIT")
depends=('nodejs')
optdepends=()
makedepends=('npm' 'jq')
source=(http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
sha256sums=('f9113c53acca0692540b6d1bcd8982fc6b61fe0ecf13e75b451417f31ece208d')

package() {
    npm install -g \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr" \
        "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Remove references to $pkgdir
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # remove manpages as they may contain a reference to $pkgdir
    find "$pkgdir" -type f -name package.json | while read pkgjson; do
        local tmppackage="$(mktemp)"
        jq 'del(.man)' "$pkgjson" > "$tmppackage"
        mv "$tmppackage" "$pkgjson"
        chmod 644 "$pkgjson"
    done

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
