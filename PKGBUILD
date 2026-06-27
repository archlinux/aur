# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Fredrik Magnusson <fredrikmagnusson3@gmail.com>
# Contributor: Pang LAN <wopanglan@gmail.com>

pkgname=opencommit
pkgver=3.3.5
pkgrel=1
pkgdesc='Auto-generate meaningful commits in a second. Killing lame commits with AI'
arch=(any)
url='https://github.com/di-sukharev/opencommit'
license=(MIT)
depends=(nodejs)
makedepends=(jq npm)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('587c6837b3514307b7c4be686c872ed8ee025d930029af167534c54fd5bc224984f22913cddeec863ad0dc4d0c677747a34d460256d160db5d6c11c59175f1a7')

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
