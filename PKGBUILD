# Maintainer: Gabriel Chamon <gchamon@gmail.com>
pkgname=dirac-cli-git
_pkgname=dirac
pkgver=r323.312d820
pkgrel=1
pkgdesc="CLI for dirac, a fast and lightweight remote development environment"
arch=('any')
url="https://github.com/dirac-run/dirac"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('dirac-cli')
conflicts=('dirac-cli')
source=("$_pkgname::git+https://github.com/dirac-run/dirac.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    npm install --ignore-scripts
    npm rebuild grpc-tools
    npm run cli:build
}

package() {
    cd "$_pkgname/cli"
    npm pack
    npm install -g --ignore-scripts --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" dirac-cli-*.tgz

    # Fix permissions
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/lib/node_modules" -type f -exec chmod 644 {} +

    # The binary should be executable
    if [ -d "$pkgdir/usr/bin" ]; then
        chmod 755 "$pkgdir/usr/bin"/*
    fi

    # Clean up npm artifacts
    rm -rf "$pkgdir/usr/lib/node_modules/dirac-cli/node_modules/.bin"

    # Remove non-deterministic fields from package.json
    find "$pkgdir/usr/lib/node_modules" -name package.json -exec sed -i \
        -e '/_where/d' \
        -e '/_args/d' \
        -e '/_from/d' \
        -e '/_id/d' \
        -e '/_integrity/d' \
        -e '/_resolved/d' \
        -e '/_shasum/d' \
        -e '/_spec/d' \
        {} +
}
