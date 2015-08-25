# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=go-ethereum
pkgver=1.1.0
pkgrel=1
pkgdesc="Ethereum Go Client (CLI)"
arch=('i686' 'x86_64')
depends=('gmp' 'leveldb' 'readline')
makedepends=('gcc' 'git' 'go' 'make' 'mercurial')
optdepends=('mist: Ether Browser')
groups=('ethereum')
url="https://github.com/ethereum/go-ethereum"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/ethereum/$pkgname/tar.gz/v$pkgver
        git+https://github.com/ethereum/go-ethereum.wiki)
sha256sums=('5cf85c85b89e6fb90957c0faede0552705a032d52cc929496a90fd02b48e71ce'
            'SKIP')
options=('!strip' '!emptydirs')

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
  for _bin in bootnode \
              disasm \
              ethtest \
              evm \
              generators \
              geth \
              rlpdump; do
    install -Dm 755 "build/bin/$_bin" "$pkgdir/usr/bin/$_bin"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
