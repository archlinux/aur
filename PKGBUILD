# Maintainer: dougEfresh <dchimento@gmail.com>

pkgname=gmcli
pkgver=0.2.0
pkgrel=1
pkgdesc='Minimal Gmail CLI for searching, threads, drafts, labels, and sending mail'
arch=('any')
url='https://github.com/badlogic/gmcli'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/badlogic/gmcli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('457dec074577c1c69419d3397ca5ecf3cfa938d76986aaa07cae1d3994acf638')
options=('!strip' '!debug')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    HUSKY=0 npm ci --ignore-scripts --no-audit --no-fund
    npm run build
    npm prune --omit=dev  --no-audit --no-fund
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -d "$pkgdir/usr/lib/node_modules/$pkgname"
    cp -r dist package.json node_modules "$pkgdir/usr/lib/node_modules/$pkgname/"

    find "$pkgdir/usr/lib/node_modules/$pkgname/node_modules" -type d -empty -delete
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/node_modules/$pkgname/dist/cli.js" "$pkgdir/usr/bin/gmcli"

    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -m644 README.md CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    cat >"$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
MIT License

Copyright (c) gmcli contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
