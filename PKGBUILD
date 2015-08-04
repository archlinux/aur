# Maintainer: Ian Naval <ianonavy@gmail.com>

_pkgname=go-ipfs
pkgname=$_pkgname-git
pkgver=0.2.1
pkgrel=1
pkgdesc="global versioned p2p merkledag file system"
arch=('i686' 'x86_64')
url="https://github.com/jbenet/$_pkgname"
license=('MIT')
makedepends=('git' 'go')
options=(!strip)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Required for go get
  export GOPATH=$srcdir

  # Make src directory for $GOPATH
  mkdir -p "$GOPATH/src"

  mv "$srcdir/$_pkgname" "$GOPATH/src"
  cd "$GOPATH/src/$_pkgname/cmd/ipfs"

  echo "Installing dependencies..."
  echo $GOPATH
  go get -v ./...
  echo "Building binary..."
  go install -v
}

package() {
  cd "$srcdir"

  installDir="$pkgdir/usr/bin"

  install -dm755 "$installDir"
  install -m755 "$srcdir/bin/ipfs" "$installDir/ipfs"
}
