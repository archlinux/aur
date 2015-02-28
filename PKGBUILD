# Maintainer: Ian Naval <ianonavy@gmail.com>

pkgname=go-ipfs-git
pkgver=0.2.1
pkgrel=1
pkgdesc="global versioned p2p merkledag file system"
arch=('i686' 'x86_64')
url="https://github.com/jbenet/go-ipfs"
license=('MIT')
makedepends=('git' 'go')
options=(!strip)

source=("$pkgname"::'git://github.com/jbenet/go-ipfs.git')

# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname/repo/config"
  # Use contents of version.go in the git source as the version number
  # (because they don't tag releases)
  printf "%s" $(grep 'const CurrentVersionNumber' version.go | sed -E 's/[^"]*"//;s/".*//')
}

build() {
  # Required for go get
  export GOPATH=$srcdir

  # Make src directory for $GOPATH
  mkdir -p "$GOPATH/src"

  mv "$srcdir/$pkgname" "$GOPATH/src"
  cd "$GOPATH/src/$pkgname/cmd/ipfs"

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
