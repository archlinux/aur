# Maintainer: fenuks, based

pkgname=prettier-plugin-xml
pkgver=3.4.1
pkgrel=1
pkgdesc='Prettier XML Plugin'
arch=(any)
url=https://github.com/prettier/plugin-xml
license=(MIT)
depends=(prettier nodejs)
makedepends=(npm jq)
source=("https://registry.npmjs.org/@${pkgname%%-*}/${pkgname#*-}/-/${pkgname#*-}-${pkgver}.tgz")
noextract=("${pkgname#*-}-${pkgver}.tgz")
sha256sums=('2a8d42ad5187f065097919bbb1bbb84527c21406c7cffd4838e44e86586fac9c')

package() {
    npm install -g --prefix "${pkgdir}/usr" --no-bin-links \
        "${srcdir}/${pkgname#*-}-${pkgver}.tgz"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "../../../lib/node_modules/@${pkgname%%-*}/${pkgname#*-}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/"

    # `local json tempjson` is unnecessary because commands in pipelines are
    # executed in their own subshells
    local mainjson=${pkgdir}/usr/lib/node_modules/@${pkgname%%-*}/${pkgname#*-}/package.json
    find "${pkgdir}/usr" -type f -name package.json -print0 |
        while read -rd '' json; do
            tempjson=$(mktemp)
            if [ "${json}" = "${mainjson}" ]; then
                jq 'with_entries(select(.key | test("^_.+") | not))' \
                    "${json}" >"${tempjson}"
            else
                jq 'del(._where,.man)' \
                    "${json}" >"${tempjson}"
            fi
            cp "${tempjson}" "${json}"
        done

    # See https://github.com/npm/npm/issues/9359
    find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +

    # See https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
