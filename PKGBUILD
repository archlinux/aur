# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgname=openui5
pkgver=1.106.0
pkgrel=1
pkgdesc='Lets you build enterprise-ready web applications, responsive to all devices, running on almost any browser of your choice.'
arch=('any')
url='https://openui5.org/'
license=('Apache')
depends=('nodejs')
makedepends=('jq' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SAP/${pkgname}/archive/${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
b2sums=('1fa6b926f7d9073729441ec4da651f696390216a5f85788f5d7f0f263906c34ed9d8384f052d7ee2db49d1392922720259145b860f53d17667b2dab35d9473de')

package() {
    npm install --cache "${srcdir}/npm-cache" -g --prefix="${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    # remove references to $pkgdir
    find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    # remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "${pkgjson}"
    find "${pkgdir}" -type f -name package.json | while read pkgjson; do
        local tmppackage="$(mktemp)"
        jq 'del(.man)' "${pkgjson}" > "${tmppackage}"
        mv "${tmppackage}" "${pkgjson}"
        chmod 644 "${pkgjson}"
    done

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/lib/node_modules/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
