# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=go-ethereum
pkgver=1.0.0
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
sha256sums=('a6c5c7508d717f0a4e0771d4f3c463c19f17f73c23ed6ea4e438553a08114913'
            'SKIP')
options=('!strip' '!emptydirs')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  make geth
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
  install -Dm 755 "build/bin/geth" "$pkgdir/usr/bin/geth"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
