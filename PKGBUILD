# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname='jam-git'
pkgver=0.6.0.a.4.g217f5db
pkgrel=1
pkgdesc="A Google Play Music console player written in Go."
arch=('x86_64')
url="https://github.com/budkin/jam"
license=('MIT')
makedepends=('go' 'govendor' 'gox')
depends=('pulseaudio')
provides=('jam')
source=($pkgname::'git+https://github.com/budkin/jam')
md5sums=(SKIP)

pkgver() {
  cd $srcdir/$pkgname
  git describe --tags --long | sed 's/^v//;s/-/./;s/-/./g'
}

build() {
  cd $srcdir/$pkgname
  make init
  mkdir -p gopath
  export GOPATH=$(pwd)/gopath
  go get github.com/boltdb/bolt
  go get github.com/budkin/gmusic
  go get github.com/budkin/jam/auth
  go get github.com/budkin/jam/lastfm
  go get github.com/budkin/jam/storage
  go get github.com/budkin/jam/ui
  # go get github.com/budkin/jam/version
  make gox -i
}

package() {
  cd $pkgdir
  mkdir -p usr/bin
  cp $srcdir/$pkgname/jam-*linux_amd64 usr/bin/jam
  chmod 755 usr/bin/jam
}
