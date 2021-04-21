# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgname=openui5
pkgver=1.89.1
pkgrel=1
pkgdesc='Lets you build enterprise-ready web applications, responsive to all devices, running on almost any browser of your choice.'
arch=('any')
url='https://openui5.org/'
license=('Apache')
depends=('nodejs')
makedepends=('jq' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/SAP/${pkgname}/archive/${pkgver}.tar.gz")
# noextract=("${pkgname}-${pkgver}.tar.gz")
sha512sums=('72a23dcfab14771bf0637984b2a1a2f7c1becc09f0b3762880d93177ac74290dad4bbd2ddaa16c450f7a8c9c998491fce5f5f55baec0c70a0e7101de68671a1f')

package() {
    npm install --cache "${srcdir}/npm-cache" -g --prefix="${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    # remove references to $pkgdir
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    # remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
    find "$pkgdir" -type f -name package.json | while read pkgjson; do
        local tmppackage="$(mktemp)"
        jq 'del(.man)' "$pkgjson" > "$tmppackage"
        mv "$tmppackage" "$pkgjson"
        chmod 644 "$pkgjson"
    done

    # install -Dm755 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # cd "${pkgdir}/usr/lib/node_modules/${pkgname}"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/lib/node_modules/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # find "${pkgdir}/usr" node_modules -name 'package.json' -exec sed -e "s|${pkgdir}||" -i {} \;
    # ./bin/modclean.js -r -a '.bin,bin.js' --ignore='license'
}
