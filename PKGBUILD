# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=opencommit
pkgver=3.2.12
pkgrel=1
pkgdesc='Auto-generate meaningful commits in a second. Killing lame commits with AI'
arch=(any)
url='https://github.com/di-sukharev/opencommit'
license=(MIT)
depends=(nodejs)
makedepends=(jq npm)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('3c58f5466b6a99e272859d0d7dda9b6581896853eab73276d350a757253a75dcf467a93c3e76a854778ca916e23147d38e3a4b72bf1a2bb59879e6cf74c6c7b2')

prepare() {
    cd $pkgname-$pkgver
    npm clean-install --ignore-scripts
}

build() {
    cd $pkgname-$pkgver
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
