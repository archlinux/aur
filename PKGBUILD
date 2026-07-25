# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=context7-mcp
_npmname=@upstash/context7-mcp
pkgver=3.2.5
pkgrel=1
pkgdesc="MCP server providing up-to-date library documentation for LLMs and AI code editors"
arch=('any')
url="https://context7.com"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=('!debug')

source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$pkgname-$pkgver.tgz")
sha256sums=('eb801dc8b6f29b315481f131fbf5258a99292fbf3325b0ef2ca2a5ac524c93cb')

latestver() {
    curl -fsSL "https://registry.npmjs.org/$_npmname/latest" | jq -r '.version'
}

package() {
    cd "$srcdir/package"

    npm install --omit=dev --ignore-scripts

    # @types/express is incorrectly listed in runtime deps by upstream
    rm -rf node_modules/@types
    rm -rf node_modules/.bin

    install -d "$pkgdir/usr/lib/$pkgname"
    cp -r . "$pkgdir/usr/lib/$pkgname/"
    chmod 755 "$pkgdir/usr/lib/$pkgname/dist/index.js"
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname/dist/index.js" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
