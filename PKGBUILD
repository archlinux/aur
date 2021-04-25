# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>
# Contributor: Kyle Laker <kyle+aur at laker dot email>

pkgname=marp-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI interface for Marp and Marpit based converters"
arch=('any')
url="https://github.com/marp-team/marp-cli"
license=('MIT')
makedepends=('npm' 'jq')
optdepends=('chromium: PDF/PPTX/image conversion'
    'google-chrome: PDF/PPTX/image conversion')
depends=('nodejs')
provides=('marp-cli')
conflicts=('marp-cli-bin')
replaces=('marp')
options=('!strip')
source=("https://registry.npmjs.org/@marp-team/$pkgname/-/$pkgname-$pkgver.tgz")

# I may need to extract it for installing license.
#noextract=("${pkgname}-${pkgver}.tgz")

sha256sums=('da9338ce328efa2870c393577e0e609f71e8a46b6b1aa910eb8b004494f6e840')

package() {
    npm install -g --user root --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    #    chmod -R go-w "$pkgdir/usr"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "$pkgdir/usr"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@marp-team/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # Install MIT license
    install -Dm644 "$srcdir/package/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    #    ln -s "../../../lib/node_modules/@marp-team/marp-cli/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
