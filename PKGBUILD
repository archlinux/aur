# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=stagereview
pkgver=0.1.6
pkgrel=1
pkgdesc="AI-powered code review tool that organizes local code changes into logical chapters"
arch=('any')
url="https://github.com/ReviewStage/stage-cli"
license=('MIT')
depends=('nodejs' 'xdg-utils' 'bash' 'sh')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
        "LICENSE::https://raw.githubusercontent.com/ReviewStage/stage-cli/main/LICENSE")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('58f2c667d65aef2976e531b82c40dcdfb60dc5cdb3b17964c8d7173f403beb1d'
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
