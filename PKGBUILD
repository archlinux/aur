# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nodejs-addon-api
_npmname=${pkgname/js}
pkgver=3.2.0
pkgrel=1
pkgdesc='Node.js API (N-API)'
arch=('any')
url="https://github.com/nodejs/$_npmname"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq' 'moreutils')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('62c664cdf9e851831e199d67af0aadbb4da8abdc058606d0fcca434b32474b98')

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
