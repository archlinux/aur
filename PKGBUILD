# Maintainer: Christoph Stahl <christoph.stahl@tu-dortmund.de>

pkgname="nodejs-formality-lang"
_pkgname=${pkgname#nodejs-}
pkgver=0.4.91
pkgrel=1
pkgdesc="An efficient proof-gramming language. It aims to be: Fast, Safe, Portable"
arch=("any")
url="https://github.com/moonad/Formality"
license=('MIT')
depends=("nodejs")
makedepends=("npm" "jq")
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("${source[0]##*/}")

package() {
    npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir"/usr "$srcdir"/"${source[0]##*/}"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
    
    find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # npm gives ownership of ALL FILES to build user 
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
md5sums=('32aea0b1f215c7f313745f686e72906f')
