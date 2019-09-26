_basepkgname=mathoid
pkgname="mediawiki-${_basepkgname}"
pkgver=0.7.1
pkgrel=2
pkgdesc="Service for creating MathML and SVGs"
source=("https://github.com/wikimedia/${_basepkgname}/archive/v${pkgver}.tar.gz"
        "sysusers.d"
        "service")
sha256sums=('946cf8a5e0826e8f4631228f8147412905a195de277c5c8f889d8e6e91a72177'
            '8b7c4852d37545ed1e728fc90e0662d8bb22c440b818543163c644ed3177afff'
            '1dfec8ec5021197089c73719805389be4ef74312e55971d5f93d4fab4dfd0f4c')
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

    install -Dm644 ../service "${pkgdir}/usr/lib/systemd/system/${_basepkgname}.service"
    install -Dm644 ../sysusers.d "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
