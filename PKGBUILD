# Maintainer: Sameer Puri <purisame@spuri.io>

_pkgname=git-remote-ipld
pkgname=$_pkgname-git
pkgver=0.0.0.g61547fd
pkgrel=1
pkgdesc='git IPLD remote helper'
url="https://github.com/ipfs-shipyard/$_pkgname"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('git')
makedepends=('git' 'go' 'jq' 'go-ipfs')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  VERSION=$(jq -r .version package.json)
  REST=$(git rev-parse --short HEAD | sed -e 's/^v//' -e 's/^\(.*\)-\([0-9]*\)-\(g[0-9a-f]*\)$/r\2.\3/')
  printf "%s.g%s" "$VERSION" "$REST" | sed -e 's/-//g'
}

prepare() {
  mkdir -p "$srcdir"/src/github.com/ipfs-shipyard
  ln -sf "$srcdir/$_pkgname" "$srcdir"/src/github.com/ipfs-shipyard/"$_pkgname"
}

build() {
  # Required for go get
  export GOPATH="$srcdir"
  export GOBIN="$srcdir/bin"
  export PATH=$PATH:$GOPATH/bin

  msg2 'Installing dependencies...'
  cd "$GOPATH"/src
  go get -d -v github.com/ipfs-shipyard/"$_pkgname"

  msg2 'Building binary...'
  cd "$GOPATH"/src/github.com/ipfs-shipyard/"$_pkgname"
  make install
}

package() {
  msg2 'Packaging binary...'
  install -Dm 755 bin/git-remote-ipld "${pkgdir}/usr/bin/git-remote-ipld"

  msg2 'Packaging auxiliary files...'
  cd "$_pkgname"
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
