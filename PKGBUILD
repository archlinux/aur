_basepkgname=mathoid
pkgname="mediawiki-${_basepkgname}"
pkgver=0.7.1
pkgrel=1
pkgdesc="Service for creating MathML and SVGs"
source=("https://github.com/wikimedia/${_basepkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('946cf8a5e0826e8f4631228f8147412905a195de277c5c8f889d8e6e91a72177')
arch=("any")
url="https://www.mediawiki.org/wiki/${_basepkgname}"
license=('Apache')
depends=('nodejs' 'librsvg')  # preq xmldom dom-compare bluebird service-runner bunyan js-yaml swagger-router mock-express-response texvcinfo speech-rule-engine svgo
makedepends=('npm' 'jq')
backup=("usr/share/webapps/mediawiki/services/mathoid/config.yaml")

package() {
    npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "$pkgdir"/usr "${srcdir}/v${pkgver}.tar.gz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$_basepkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
