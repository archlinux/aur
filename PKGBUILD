# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nodejs-addon-api
_npmname=${pkgname/js}
pkgver=3.2.1
pkgrel=1
pkgdesc='Node.js API (N-API)'
arch=(any)
url="https://github.com/nodejs/$_npmname"
license=(MIT)
depends=(nodejs)
makedepends=(npm jq moreutils)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c19e16bd3335dabf1b7ce6c92d7129fbf9107bedf4e07e104dde9f57132c4b1f')

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
