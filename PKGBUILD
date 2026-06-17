# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Fredrik Magnusson <fredrikmagnusson3@gmail.com>
# Contributor: Pang LAN <wopanglan@gmail.com>

pkgname=opencommit
pkgver=3.3.2
pkgrel=1
pkgdesc='Auto-generate meaningful commits in a second. Killing lame commits with AI'
arch=(any)
url='https://github.com/di-sukharev/opencommit'
license=(MIT)
depends=(nodejs)
makedepends=(jq npm)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('447da6eb3d3953727e58a55b03d8322899039638bbe9618cc7fa40632acaf60024a7605a9bb2060fb845040a0c66f73b1ddd5d96bd72699938ab0869fa408883')

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
