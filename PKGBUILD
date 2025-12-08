# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=osgrep
pkgver=0.5.10
pkgrel=1
pkgdesc="Local grep-like semantic search tool for your codebase"
arch=('any')
url="https://github.com/Ryandonofrio3/osgrep"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('3ca52f9ca1c73c48bfadb8202c418fa8991effe9c279f4272ab7830356f45e4e')
noextract=("$pkgname-$pkgver.tgz")

pkgver() {
    curl -s "https://registry.npmjs.org/$pkgname/latest" | jq -r '.version'
}

package() {
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

    # Remove unnecessary platform-specific binaries
    local node_modules="$pkgdir/usr/lib/node_modules"

    # Remove non-Linux platforms (darwin, win32, etc.)
    find "$node_modules" -type d \( -name darwin -o -name win32 \) -exec rm -rf {} + 2>/dev/null || true

    # Remove non-x64 architectures (arm64, arm, ia32, etc.)
    find "$node_modules" -type d -path '*/linux/*' ! -name x64 ! -name linux -exec rm -rf {} + 2>/dev/null || true

    # Remove unnecessary files
    find "$pkgdir/usr" -type d -name .cache -exec rm -rf {} + 2>/dev/null || true
    find "$pkgdir/usr" -type f -name 'package.json' -exec sed -i '/_where/d' {} + 2>/dev/null || true

    # npm creates references to $pkgdir - remove them
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Fix permissions
    chown -R root:root "$pkgdir"
}
