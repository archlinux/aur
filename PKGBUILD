# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=aicommits
pkgver=4.2.2
pkgrel=1
pkgdesc='A CLI that writes your git commit messages for you with AI'
arch=(any)
url=https://github.com/Nutlope/$pkgname
license=(MIT)
depends=(nodejs)
makedepends=(npm pnpm)
checkdepends=(git)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('8ac8acdbdf1514f7550ada05c7c7fb7aee205fb6c6cbd6ff56d3bc2a8a36eddf02a59ef4a30ee470dbcbf4629494f1c74c6760d619dd8e2283a98c25f382b4cd')

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
