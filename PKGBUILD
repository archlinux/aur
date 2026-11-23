# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Fredrik Magnusson <fredrikmagnusson3@gmail.com>
# Contributor: Pang LAN <wopanglan@gmail.com>

pkgname=opencommit
pkgver=3.3.12
pkgrel=1
pkgdesc='Auto-generate meaningful commits in a second. Killing lame commits with AI'
arch=(any)
url='https://github.com/di-sukharev/opencommit'
license=(MIT)
depends=(nodejs)
makedepends=(jq npm)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('5246bae8ebe1bec17a6b41a360595dcf29da7aa81dd22179ceb8013a3013c4da5e6939278746d3fbd256110811377bb9517ba5f4524abb9c7c056596ce6c6b1e')

prepare() {
    cd $pkgname-$pkgver
    npm clean-install --ignore-scripts
}

build() {
    cd $pkgname-$pkgver
    npm run build
    npm pkg set bundledDependencies="$(jq '.dependencies | keys' package.json)" --json
    npm pack
}

check() {
    cd $pkgname-$pkgver
    npm test
}

package() {
    cd $pkgname-$pkgver
    npm install --global --install-links --offline --prefix "$pkgdir/usr" $pkgname-$pkgver.tgz

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /usr/lib/node_modules/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
