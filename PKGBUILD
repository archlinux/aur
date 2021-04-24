# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nodejs-addon-api
_npmname=${pkgname/js}
pkgver=3.1.0
pkgrel=2
pkgdesc='Node.js API (N-API)'
arch=('any')
url="https://github.com/nodejs/$_npmname"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq' 'moreutils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('564962f9e9d1d5a39aef3205651f62660b9eaa693acaf4be01744a935849bc2b')

prepare() {
    cd "$_npmname-$pkgver"
    # Suppress install or link against this package triggering a build!
    jq 'del(.scripts[])' package.json | sponge package.json
}

build() {
    cd "$_npmname-$pkgver"
    npm pack
}

package() {
    cd "$_npmname-$pkgver"
    npm install \
        --production \
        --global \
        --no-update-notifier \
        --no-audit \
        --no-fund \
        --cache "$srcdir/npm-cache" \
        --prefix "$pkgdir/usr" \
        $_npmname-$pkgver.tgz
    chown -R root:root "$pkgdir"
}
