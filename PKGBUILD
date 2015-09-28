# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=go-ethereum-git
pkgver=20150925
pkgrel=1
pkgdesc="Ethereum Go Client (CLI)"
arch=('i686' 'x86_64')
depends=('gmp' 'leveldb' 'readline')
provides=('go-ethereum')
conflicts=('go-ethereum')
makedepends=('gcc' 'git' 'go' 'make' 'mercurial')
optdepends=('mist: Ether Browser')
groups=('ethereum')
url="https://github.com/ethereum/go-ethereum"
license=('GPL')
source=(git+https://github.com/ethereum/go-ethereum#branch=develop
        git+https://github.com/ethereum/go-ethereum.wiki)
sha256sums=('SKIP'
            'SKIP')
options=('!strip' '!emptydirs')

pkgver() {
	cd ${pkgname%-git}
	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  msg2 'Building...'
  make all
}

package() {
  cd "$srcdir/${pkgname%-git}"

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
