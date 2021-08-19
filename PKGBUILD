#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Contributor: Kyle Laker <kyle+aur at laker dot email>

pkgname=marp-cli
pkgver=1.3.2
pkgrel=1
pkgdesc='A CLI interface for Marp and Marpit based converters'
url='https://github.com/marp-team/marp-cli'
arch=('x86_64')
license=('MIT')
makedepends=(
    'npm'
    'jq'
)
optdepends=(
    'chromium: PDF/PPTX/image conversion'
    'google-chrome: PDF/PPTX/image conversion'
)
depends=('nodejs')
provides=('marp-cli')
conflicts=('marp-cli-bin')
replaces=('marp')
options=('!strip')
source=("https://registry.npmjs.org/@marp-team/$pkgname/-/$pkgname-$pkgver.tgz")

# I may need to extract it for installing license.
#noextract=("${pkgname}-${pkgver}.tgz")

b2sums=('449c9b5767f68ff8704c912d3ef79aaafc9994544f1df9504a40a5a6e1263752e4726cda57e254e102cd4ae5b0a7698e44fe0056acdaa887eb4d25f0391eb6ad')

package() {
    npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
    #    chmod -R go-w "$pkgdir/usr"
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    chown -R root:root "$pkgdir/usr"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    # local tmppackage
    local pkgjson="$pkgdir/usr/lib/node_modules/@marp-team/$pkgname/package.json"
    # local pkgjson

    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # Install MIT license
    install -Dm644 "$srcdir/package/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    #    ln -s "../../../lib/node_modules/@marp-team/marp-cli/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
