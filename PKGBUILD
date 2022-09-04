# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgname=openui5
pkgver=1.102.7
pkgrel=1
pkgdesc='Lets you build enterprise-ready web applications, responsive to all devices, running on almost any browser of your choice.'
arch=('any')
url='https://openui5.org/'
license=('Apache')
depends=('nodejs')
makedepends=('jq' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SAP/${pkgname}/archive/${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
b2sums=('d6cc767e4585dc31aee250bec5ffada180e6f7486f9f214515272a4091a43a9f89856dc77b39d70a645c1d89cb8049b8930590902102472982ccf001256c18cd')

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
