# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=mist
pkgver=20150519
pkgrel=1
pkgdesc="Ether Browser for Ethereum"
arch=('i686' 'x86_64')
depends=('gmp'
         'leveldb'
         'qt5-base'
         'qt5-declarative'
         'qt5-quickcontrols'
         'qt5-webengine'
         'readline')
makedepends=('gcc'
             'git'
             'go'
             'godep'
             'make'
             'mercurial')
optdepends=('go-ethereum: Ethereum Go developer client (CLI)')
groups=('ethereum')
url="https://github.com/ethereum/go-ethereum"
license=('GPL')
options=('!strip' '!emptydirs')
install=mist.install

pkgver() {
  date +%Y%m%d
}

build() {
  msg2 'Building...'
  export GOPATH="$srcdir"
  go get -d github.com/ethereum/go-ethereum/...
  cd "$srcdir/src/github.com/ethereum/go-ethereum" && git checkout develop
  godep restore
  cd ./cmd/mist && go install
}

package() {
  msg2 'Installing Mist assets...'
  install -dm 755 "$pkgdir/usr/share/mist/src"
  for _lib in `find "$srcdir/src" -mindepth 1 -maxdepth 1 -printf '%f\n'`; do
    cp -dpr --no-preserve=ownership "$srcdir/src/$_lib" "$pkgdir/usr/share/mist/src/$_lib"
  done
  mv "$pkgdir/usr/share/mist/src/github.com/ethereum/go-ethereum/cmd/mist/assets"/* \
     "$pkgdir/usr/share/mist" && rm -rf "$pkgdir/usr/share/mist/src"

  msg2 'Installing Mist binary...'
  for _bin in `find "$srcdir/bin" -mindepth 1 -maxdepth 1 -type f -printf '%f\n'`; do
    install -Dm 755 "$srcdir/bin/$_bin" "$pkgdir/usr/bin/$_bin"
  done

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
  find "$pkgdir" -type d -name .hg -exec rm -r '{}' +
  find "$pkgdir" -type f -name .hgignore -exec rm -r '{}' +
}
