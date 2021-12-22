# Maintainer: Gerald Wu <gerald at geraldwu dot com>

pkgname=cdktf-cli
pkgver=0.8.3
pkgrel=1
pkgdesc="Cloud Development Kit for Terraform"
arch=('any')
url='https://www.npmjs.com/package/cdktf'
license=('MPL2')
depends=('python' 'nodejs' 'terraform')
makedepends=('npm' 'jq')
noextract=("${pkgname}-${pkgver}.tgz")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
        "https://raw.githubusercontent.com/hashicorp/terraform-cdk/master/LICENSE")
sha256sums=('4cc0d24a24c5c1ded68a8325dcdd3b57fd0af34531292d5ba2a794ae898ad1eb'
            'a830016911a348a54e89bd54f2f8b0d8fffdeac20aecfba8e36ebbf38a03f5ff')

package() {
    # Install
    npm install -s -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Fix ownership of ALL FILES
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    # Remove references to $pkgdir
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    find "$pkgdir" -type f -name package.json | while read pkgjson; do
        local tmppackage="$(mktemp)"
        jq 'del(.man)' "$pkgjson" >"$tmppackage"
        mv "$tmppackage" "$pkgjson"
        chmod 644 "$pkgjson"
    done
}

