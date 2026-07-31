# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Fredrik Magnusson <fredrikmagnusson3@gmail.com>
# Contributor: Pang LAN <wopanglan@gmail.com>

pkgname=opencommit
pkgver=3.3.10
pkgrel=1
pkgdesc='Auto-generate meaningful commits in a second. Killing lame commits with AI'
arch=(any)
url='https://github.com/di-sukharev/opencommit'
license=(MIT)
depends=(nodejs)
makedepends=(jq npm)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('c392b9677108b956b52ff315b931d4ddb7ebdd20f6d0b50c215b3121a3a451c91313fc5ded3971f5a192d7af8e9ce6fa3b6ed21dd7689d4835684cdaccf2043c')

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
