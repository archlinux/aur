# Maintainer: Pierce Lopez <pierce.lopez@gmail.com>
# Original Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=nsq
pkgver=1.1.0
pkgrel=1
pkgdesc="A realtime distributed messaging platform"
arch=( 'i686' 'x86_64' )
url="http://nsq.io/"
makedepends=( "git" "go" "dep" )
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitly/nsq/archive/v$pkgver.tar.gz")
sha256sums=('85cb15cc9a7b50e779bc8e76309cff9bf555b2f925c2c8abe81d28d690fb1940')
options=( '!strip' )


build() {
  cd "$srcdir"
  export GOPATH=$PWD/go
  NSQIO=$GOPATH/src/github.com/nsqio

  mkdir -p        "$NSQIO"
  mv nsq-$pkgver  "$NSQIO/nsq"
  cd              "$NSQIO/nsq"
  dep ensure
  make GOFLAGS="-ldflags=-w"
}

package() {
  cd "$srcdir/go/src/github.com/nsqio/nsq"
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
