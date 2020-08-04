# Maintainer: Kyle Laker <kyle+aur at laker dot email>
pkgname=marp-cli
pkgver=0.20.0
pkgrel=1
pkgdesc="A CLI interface for Marp and Marpit based converters"
arch=('any')
url="https://github.com/marp-team/marp-cli"
license=('MIT')
makedepends=('npm' 'jq')
optdepends=('chromium: PDF/PPTX/image conversion'
            'google-chrome: PDF/PPTX/image conversion')
provides=('marp-cli')
conflicts=('marp-cli-bin')
replaces=('marp')
options=('!strip')
source=("https://registry.npmjs.org/@marp-team/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('470a9cfb0d017accfa7278f80f05034b1fdb887119e845fe9c44225c2ee38a48')

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "${srcdir}/${pkgname}-${pkgver}.tgz"
    chmod -R go-w "$pkgdir/usr"
    chown -R root:root "$pkgdir/usr"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@marp-team/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 0644 "$pkgjson"
    
    # Install MIT license
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "../../../lib/node_modules/@marp-team/marp-cli/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
