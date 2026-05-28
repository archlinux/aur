# Maintainer: coffee <coffee@coffeecat.top>
pkgname=deepseek-reasonix-tui
_pkgname=reasonix
pkgver=0.53.2
pkgrel=1
pkgdesc="DeepSeek-native coding agent: cache-first loop, flash-first cost control, tool-call repair."
arch=('any')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
depends=('nodejs>=22' 'npm')
makedepends=('jq')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('257a6188e68993ad9f091e1b8886ff31e590a265614152446899dbb10fe4cf63')

prepare() {
    cd "$srcdir"
    if [[ -d package && ! -d "$_pkgname-$pkgver" ]]; then
        mv package "$_pkgname-$pkgver"
    fi
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    # Published tarball has workspace:* devDeps that choke npm — strip them
    jq 'del(.devDependencies) | .workspaces = []' package.json > package.json.clean
    mv package.json.clean package.json
    # Install production dependencies only
    npm install --omit=dev
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    # Install to system node_modules path
    local moddir="$pkgdir/usr/lib/node_modules/$_pkgname"
    mkdir -p "$moddir"
    cp -r . "$moddir"

    # Clean up: remove npm-related artifacts that shouldn't ship
    rm -rf "$moddir/node_modules/.cache"

    # Create binary symlinks
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/usr/lib/node_modules/$_pkgname/dist/cli/index.js" "$pkgdir/usr/bin/reasonix"
    ln -sf "/usr/lib/node_modules/$_pkgname/dist/cli/index.js" "$pkgdir/usr/bin/dsnix"
}
