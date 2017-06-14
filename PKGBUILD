# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# Contributor: Roasbeef
# URL: https://github.com/lightningnetwork/lnd
# Upstream: https://github.com/lightningnetwork/lnd

pkgname=('lnd-git')
pkgver=0.2.1.alpha.291.ge4563ca
pkgrel=1
pkgdesc='The Lighting Network Daemon, for secure off-chain bitcoin transactions.'
arch=('i686' 'x86_64')
url='https://github.com/lightningnetwork/lnd'
license=('MIT')
depends=('glibc')
makedepends=('git' 'glide' 'go')
provides=('lnd' 'btcd')
conflicts=('btcd')
source=("$pkgname::git+https://github.com/lightningnetwork/lnd.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  export GOPATH="$srcdir"
  rm -fr "$srcdir/src"
  git clone "$srcdir/$pkgname" "$GOPATH/src/github.com/lightningnetwork/lnd"
}

package() {
  export GOPATH="$srcdir"
  cd "$GOPATH/src/github.com/lightningnetwork/lnd"
  glide install
  go install . ./cmd/...
  go get -u github.com/roasbeef/btcutil
  cd $GOPATH/src/github.com/roasbeef/btcd
  glide install
  go install . ./cmd/...

  for _bin in btcctl btcd lnd; do
    install -Dm 755 "$srcdir/bin/$_bin" -t "$pkgdir/usr/bin";
  done

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
