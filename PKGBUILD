# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=aicommits
pkgver=4.1.0
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with AI'
arch=(any)
url=https://github.com/Nutlope/$pkgname
license=(MIT)
depends=(nodejs)
makedepends=(npm pnpm)
checkdepends=(git)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('db4e0aec03c240ad8d4bbc9fb71037c82950722f59f114c5db56449b5c29061223b9116cdec1dc9ee47a957e426e6530469fda745890166797a0e874244d66f0')

prepare() {
    cd $pkgname-$pkgver
    sed -i "s/version !== '0.0.0-semantic-release'/false/" src/cli.ts
    pnpm install --frozen-lockfile --ignore-scripts
}

build() {
    cd $pkgname-$pkgver
    pnpm pkg set version=$pkgver
    pnpm pack
}

check() {
    cd $pkgname-$pkgver
    pnpm test
}

package() {
    cd $pkgname-$pkgver
    npm install --global --install-links --offline --prefix "$pkgdir/usr" $pkgname-$pkgver.tgz

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /usr/lib/node_modules/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
