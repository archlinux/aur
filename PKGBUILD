# Maintainer: Gerald Wu <gerald at geraldwu dot com>

pkgname=cdktf-cli
pkgver=0.15.2
pkgrel=1
pkgdesc="Cloud Development Kit for Terraform"
arch=('any')
url="https://github.com/hashicorp/terraform-cdk"
license=('MPL2')
depends=('python' 'nodejs' 'terraform')
makedepends=('npm' 'jq')
noextract=("${pkgname}-${pkgver}.tgz")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
        "https://raw.githubusercontent.com/hashicorp/terraform-cdk/master/LICENSE")
sha256sums=('35f4ccf296e69388c2f07fcf839dd1e488d9edb69d226f3d92f058435df94d4a'
            '8a318096d516c4b23566f94f4129260a9d4f72672dc52405573b619451f7b6c2')

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

