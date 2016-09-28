pkgname=go-ethereum
pkgver=1.4.14
pkgrel=1
pkgdesc="Ethereum Go Client (CLI) - compiled from source"
arch=('i686' 'x86_64')
depends=('gmp' 'leveldb' 'readline')
makedepends=('gcc' 'git' 'go' 'make')
optdepends=('mist: Ether Browser')
conflicts=('geth')
provides=('geth')
groups=('ethereum')
url="https://github.com/ethereum/go-ethereum"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/ethereum/$pkgname/tar.gz/v$pkgver
        git+https://github.com/ethereum/go-ethereum.wiki)
sha256sums=('33400498d165f0f1f70f1af320d7868705979e7cb7bae823f595d9c78cbb7f0a'
            'SKIP')
options=('!emptydirs')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  for _l in AUTHORS COPYING COPYING.LESSER; do
    install -Dm 644 $_l "$pkgdir/usr/share/licenses/go-ethereum/$_l"
  done

  msg2 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/go-ethereum/README.md"

  msg2 'Installing wiki...'
  cp -dpr --no-preserve=ownership "$srcdir/go-ethereum.wiki" \
    "$pkgdir/usr/share/doc/go-ethereum/wiki"

  msg2 'Installing...'
  for _bin in build/bin/*; do
    install -Dm 755 "$_bin" "$pkgdir/usr/bin/"`basename $_bin`
  done

  msg2 'Cleaning up pkgdir...'
  rm -R $pkgdir/usr/share/doc/go-ethereum/wiki/.git
}
