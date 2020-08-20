# Maintainer: Dāvis Mosāns <davispuh at gmail dot com>

_package=epicgames-client
pkgname="nodejs-$_package"
pkgver="2.0.25"
pkgrel=1
pkgdesc="Unofficial EpicGames Client for Node.js"
arch=("any")
url="https://github.com/SzymonLisowiec/node-epicgames-client"
license=("MIT")
depends=("nodejs")
makedepends=("npm")

pkgver() {
    npm info --json "$_package" | jq ".version"
}

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$_package"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "$pkgdir/usr" -type d -exec chmod 755 {} +

    find "$pkgdir" -name package.json -print0 | xargs -r0 sed -i "s|$pkgdir||"
    find "$pkgdir" -name package.json -print0 | xargs -r0 sed -i "s|$srcdir|/usr/lib/node_modules/$_package|"

}

