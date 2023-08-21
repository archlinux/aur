# Maintainer: fenuks, based

pkgname=prettier-plugin-xml
pkgver=3.2.0
pkgrel=1
pkgdesc='Prettier XML Plugin'
arch=(any)
url=https://github.com/prettier/plugin-xml
license=(MIT)
depends=(prettier nodejs)
makedepends=(npm jq)
source=("https://registry.npmjs.org/@${pkgname%%-*}/${pkgname#*-}/-/${pkgname#*-}-${pkgver}.tgz")
noextract=("${pkgname#*-}-${pkgver}.tgz")
sha256sums=('b675645af4cfd346c937e7b4a15d58950051ca3a3515719fb51d6346d8b57342')

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
