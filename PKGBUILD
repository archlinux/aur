# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=stagereview
pkgver=0.1.4
pkgrel=1
pkgdesc="AI-powered code review tool that organizes local code changes into logical chapters"
arch=('x86_64')
url="https://github.com/ReviewStage/stage-cli"
license=('MIT')
depends=('nodejs' 'xdg-utils')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
        "LICENSE::https://raw.githubusercontent.com/ReviewStage/stage-cli/main/LICENSE")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('02dba9baa15e40579b7fdacd5e00b7a15d66c5a8dd36000d3797027aa4fbd0d8'
            'f3c40b30c0a39199c3da204c53ac2c27166bf976cf5e526edce2c0154ce780d7')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
