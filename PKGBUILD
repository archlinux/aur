# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=ampcode
pkgver=0.0.1767441688_g5b15f4
pkgrel=1
pkgdesc="Amp CLI (Sourcegraph's agentic coding tool) packaged from npm releases"
arch=('any')
url="https://ampcode.com"
license=('custom:proprietary')
depends=('nodejs' 'ripgrep')
makedepends=('npm')
options=('!debug')
provides=('amp')
conflicts=('amp' 'ampcode-bin')
replaces=('sourcegraph-amp')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@sourcegraph/amp/-/amp-${pkgver//_/-}.tgz")
sha256sums=('cf6d77ac7ed8ce2bd84f470122735cc9f646ecb5e17642a022de10fa0b540d23')

latestver() {
    if [[ ${0##*/} == makepkg ]]; then
        printf '%s\n' "$pkgver"
        return
    fi

    curl -fsS "https://registry.npmjs.org/%40sourcegraph%2Famp" \
        | jq -r '."dist-tags".latest' \
        | tr '-' '_'
}

package() {
    local npm_cache="$srcdir/npm-cache"
    local npm_tarball="$srcdir/$pkgname-$pkgver.tgz"

    export HOME="$srcdir"
    mkdir -p "$npm_cache"

    npm install -g --prefix "$pkgdir/usr" \
        --cache "$npm_cache" \
        --no-package-lock \
        --omit=dev \
        "$npm_tarball"

    find "$pkgdir/usr" -type d -name .cache -exec rm -rf {} +
    find "$pkgdir/usr" -type f -name 'package.json' -exec sed -i '/_where/d' {} +
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 -r sed -i '/_where/d'

    install -Dm644 "$pkgdir/usr/lib/node_modules/@sourcegraph/amp/LICENSE.md" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    rm -rf "$npm_cache"
    chown -R root:root "$pkgdir"
}
