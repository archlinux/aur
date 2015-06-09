# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=go-ethereum
pkgver=20150519
pkgrel=1
pkgdesc="Ethereum Go Client (CLI)"
arch=('i686' 'x86_64')
depends=('gmp' 'leveldb' 'readline')
makedepends=('gcc' 'git' 'go' 'make' 'mercurial')
optdepends=('mist: Ether Browser')
groups=('ethereum')
url="https://github.com/ethereum/go-ethereum"
license=('GPL')
options=('!strip' '!emptydirs')

pkgver() {
  date +%Y%m%d
}

prepare() {
  msg2 'Fetching ethereum-serpent Go bindings...'
  GOPATH="$srcdir" go get -d github.com/ethereum/serpent-go \
    && cd "$srcdir/$GOPATH/src/github.com/ethereum/serpent-go" \
    && git submodule init && git submodule update
}

build() {
  msg2 'Building...'
  for _cmd in bootnode disasm ethtest evm geth rlpdump; do
    GOPATH="$srcdir" go get -u github.com/ethereum/go-ethereum/cmd/$_cmd
  done
}

package() {
  msg2 'Installing binaries...'
  for _bin in `find "$srcdir/bin" -mindepth 1 -maxdepth 1 -type f -printf '%f\n'`; do
    install -Dm 755 "$srcdir/bin/$_bin" "$pkgdir/usr/bin/$_bin"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
  find "$pkgdir" -type d -name .hg -exec rm -r '{}' +
  find "$pkgdir" -type f -name .hgignore -exec rm -r '{}' +
}
