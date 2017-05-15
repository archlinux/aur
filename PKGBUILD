# Maintainer: Pierce Lopez <pierce.lopez@gmail.com>
# Original Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=nsq
realver=1.0.0-compat
pkgver=1.0.0compat
pkgrel=1
pkgdesc="A realtime distributed messaging platform"
arch=( 'i686' 'x86_64' )
url="http://nsq.io/"
makedepends=( "go-gpm" "git" "go" )
license=('MIT')
source=("$pkgname-$realver.tar.gz::https://github.com/bitly/nsq/archive/v$realver.tar.gz")
sha256sums=('c279d339eceb84cad09e2c2bc21e069e37988d0f6b7343d77238374081c9fd29')
options=( '!strip' )


build() {
  cd "$srcdir"
  export GOPATH=$PWD/go
  NSQIO=$GOPATH/src/github.com/nsqio

  mkdir -p        "$NSQIO"
  mv nsq-$realver "$NSQIO/nsq"
  cd              "$NSQIO/nsq"
  go-gpm install
  make GOFLAGS='-ldflags="-s -w"'
}

package() {
  cd "$srcdir/go/src/github.com/nsqio/nsq"
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
