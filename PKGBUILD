# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=osgrep
pkgver=0.3.0
pkgrel=1
pkgdesc="Local grep-like semantic search tool for your codebase"
arch=('any')
url="https://github.com/Ryandonofrio3/osgrep"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('eed1e5dd4c0a02196e705cac5e9284e15a0e474707bc5c855df8ff143e3d1c88')
noextract=("$pkgname-$pkgver.tgz")

pkgver() {
    curl -s "https://registry.npmjs.org/$pkgname/latest" | jq -r '.version'
}

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

    # Remove unnecessary files
    find "$pkgdir/usr" -type d -name .cache -exec rm -rf {} +
    find "$pkgdir/usr" -type f -name 'package.json' -exec sed -i '/_where/d' {} +

    # npm creates references to $pkgdir - remove them
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Fix permissions
    chown -R root:root "$pkgdir"
}
