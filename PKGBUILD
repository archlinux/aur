pkgname=go-ethereum
pkgver=1.4.7
pkgrel=1
pkgdesc="Ethereum Go Client (CLI) - compiled from source"
arch=('i686' 'x86_64')
depends=('gmp' 'leveldb' 'readline')
makedepends=('gcc' 'git' 'go' 'make' 'mercurial')
optdepends=('mist: Ether Browser')
conflicts=('geth')
provides=('geth')
groups=('ethereum')
url="https://github.com/ethereum/go-ethereum"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/ethereum/$pkgname/tar.gz/v$pkgver
        git+https://github.com/ethereum/go-ethereum.wiki)
sha256sums=('3d908ce3e077d7c0fd7277290f4228a4b5dbde23f9e46775c99b3a650efa9474'
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
  for _bin in build/bin/*; do
    install -Dm 755 "$_bin" "$pkgdir/usr/bin/"`basename $_bin`
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
