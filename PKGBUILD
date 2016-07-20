# Maintainer: Pierce Lopez <pierce.lopez@gmail.com>
# Original Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=nsq
pkgver=0.3.8
pkgrel=1
pkgdesc="A realtime distributed messaging platform"
arch=( 'i686' 'x86_64' )
url="http://nsq.io/"
makedepends=( "go-gpm" "git" "go" )
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitly/nsq/archive/v$pkgver.tar.gz")
sha256sums=('d9107cdfe218523a74ee801caaa97968becb4b82dae7085dbb52d05c25028ff3')
options=( '!strip' )


build() {
  cd "$srcdir"
  export GOPATH=$PWD/go
  NSQIO=$GOPATH/src/github.com/nsqio

  mkdir -p       "$NSQIO"
  mv nsq-$pkgver "$NSQIO/nsq"
  cd             "$NSQIO/nsq"
  go-gpm install
  make GOFLAGS='-ldflags="-s -w"'
}

package() {
  cd "$srcdir/go/src/github.com/nsqio/nsq"
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
