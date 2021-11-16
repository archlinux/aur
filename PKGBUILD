#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Kyle Laker <kyle+aur at laker dot email>

pkgname=marp-cli
pkgver=1.4.2
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

b2sums=('11acd8172082b34613c7f746d652faaaf842b16758d5b7ef1c15c4928105ad2e6033613adc654f666d0876e44ba4a116abc42c4cdb691801a66c51706ab41d47')

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
