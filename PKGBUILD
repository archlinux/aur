# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=aicommits
pkgver=4.0.1
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with AI'
arch=(any)
url=https://github.com/Nutlope/$pkgname
license=(MIT)
depends=(nodejs)
makedepends=(npm pnpm)
checkdepends=(git)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('4266deff2e3fa34e022d48c381d3120b638487c1a83bef671a121ff01b3159d0175fe802b1e50d90a99fbb6cdddaa03a3c0d632a5e95a5ffc3f50e1ddc2b530d')

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
