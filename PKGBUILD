# Maintainer: coffee <coffee@coffeecat.top>
pkgname=deepseek-reasonix-tui
_pkgname=reasonix
pkgver=1.0.0
pkgrel=1
pkgdesc="Cache-first DeepSeek coding agent for the terminal."
arch=('any')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
depends=('nodejs>=22' 'npm')
makedepends=('jq')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('fbdc40d47cf8358bc68a60d55c3e11f465b2bb72cfa1d2a1d7b1144de4c727cd')

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
    chmod +x "$pkgdir/usr/lib/node_modules/reasonix/bin/reasonix.js"

    # Create binary symlinks
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/usr/lib/node_modules/$_pkgname/bin/reasonix.js" "$pkgdir/usr/bin/reasonix"
}
