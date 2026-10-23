# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=aicommits
pkgver=4.2.5
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with AI'
arch=(any)
url=https://github.com/Nutlope/$pkgname
license=(MIT)
depends=(nodejs)
makedepends=(npm pnpm)
checkdepends=(git)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('8dce59fe87459da4bf08fe2121c1d7265a0b4799575d5523af629f3fb2a606330d830d2e407da1d43c7498252f4475ca2fb140d34408d04eb6038a05442ef81e')

prepare() {
    cd $pkgname-$pkgver
    sed -i "s/version !== '0.0.0-semantic-release'/false/" src/cli.ts
    sed -i "/auto-update/d" tests/index.ts
    pnpm pkg delete packageManager
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
