# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=aicommits
pkgver=4.1.1
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with AI'
arch=(any)
url=https://github.com/Nutlope/$pkgname
license=(MIT)
depends=(nodejs)
makedepends=(npm pnpm)
checkdepends=(git)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('59dceebf684fc53e984116736a5bd98e8cad7b4d7c44a6d7e25dd878962ca4d467e5419904ad05067d8a518f68c4ee38d2c03ace4aa67d797891ffcefb020f65')

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
