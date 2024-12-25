# Maintainer: Jonathan Wright <jon@than.io>

pkgname=go-bindata-git
pkgver=4.0.2.r0.g2394b82
pkgrel=1
pkgdesc="Converts any file into managable Go source code - git checkout"
arch=(x86_64)
url="https://github.com/kevinburke/go-bindata/"
license=(CC0-1.0)

source=("git+https://github.com/kevinburke/go-bindata.git")
sha256sums=('SKIP')

makedepends=(git go)
provides=(go-bindata)
conflicts=(go-bindata)
options=('!strip')

pkgver() {
  cd "go-bindata"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export GOPATH=$srcdir/gopath
  rm -rf $srcdir/gopath
  mkdir -p "$srcdir/gopath/src/github.com/kevinburke"
  export GO111MODULE=auto
  ln -s $srcdir/go-bindata $GOPATH/src/github.com/kevinburke/go-bindata
  cd $GOPATH/src/github.com/kevinburke/go-bindata

  go build -v -o .bin ./go-bindata
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm755 "$srcdir/gopath/src/github.com/kevinburke/go-bindata/.bin" $pkgdir/usr/bin/go-bindata
}
