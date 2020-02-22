# Maintainer: ManiacTwister <aur@maniactwister.de>
pkgname=tunneller-git
pkgver=release.0.6.r7.gf02ebdb
pkgrel=1
pkgdesc='Tunneller allows you to expose services which are running on localhost, or on your local network, to the public internet.'
arch=('x86_64')
url='https://github.com/skx/tunneller'
license=('GPL')
makedepends=('git' 'go-pie')
source=("$pkgname::git+https://github.com/skx/tunneller.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  export GOPATH="$srcdir"/gopath
  mkdir -p gopath/src/github.com/tunneller
  cp -r $pkgname/* gopath/src/github.com/tunneller
}

build() {
  cd "gopath/src/github.com/tunneller"

#go install
  go install \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

package() {
  install -Dm755 gopath/bin/tunneller "$pkgdir"/usr/bin/tunneller
}

