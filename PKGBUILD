# Maintainer: 13floorelevators <the13thfloorelevators@protonmail.com> <BURST-737A-XKSG-M424-67UVT>

pkgname=aspera-git
_realname=Aspera
pkgver=v1.0
pkgrel=1
pkgdesc="My fork of PoCC's BURST aspera"
arch=('x86_64')
url="https://github.com/RokyErickson/Aspera"
license=('GPL3')
makedepends=(go dep git go)
source=("git"+"https://github.com/RokyErickson/Aspera.git")
sha256sums=('SKIP')
pkgver() {
        cd "${srcdir}"
        git describe --always  --long --tags | sed 
's/\([^-]*-g\)/r\1/;s/-/./g'
}


_importpath="github.com/RokyErickson/${_realname}"

prepare() {
  export GOPATH="${srcdir}/_go"
  mkdir -p $(dirname "$GOPATH/src/${_importpath}/")
  ln -sf "${srcdir}/${_realname}" "$GOPATH/src/${_importpath}"
  cd "$GOPATH/src/${_importpath}"
  dep ensure -v
}

check() {
  export GOPATH="${srcdir}/_go"
  cd "$GOPATH/src/${_importpath}"
  # see https://github.com/snail007/goproxy/issues/156
  #go test $(go list ./...)
}

build() {
  export GOPATH="${srcdir}/_go"
  cd "$GOPATH/src/${_importpath}"
  go build
}

package() {
  export GOPATH="$srcdir/_go"
  cd "$GOPATH/src/${_importpath}"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "${_realname}" "$pkgdir/usr/bin/${_realname}"
}


