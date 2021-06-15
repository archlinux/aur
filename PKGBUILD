# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nodejs-addon-api
_npmname=${pkgname/js}
pkgver=4.0.0
pkgrel=1
pkgdesc='Node.js API (N-API)'
arch=(any)
url="https://github.com/nodejs/$_npmname"
license=(MIT)
depends=(nodejs)
makedepends=(npm jq moreutils)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a61019de219cfbb4943b109fd1c56466c48dedbfcce10567f8e7826992be9c0d')

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

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    chmod -R u=rwX,go=rX "$pkgdir"

    # npm installs package.json owned by build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
