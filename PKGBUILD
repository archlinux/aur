# Maintainer: Dasith Gunawardhana <dasith@dg10a.com>

_pkgname=waypoint
pkgname=${_pkgname}-git
pkgver=42efa540
pkgrel=1
pkgdesc="Waypoint allows developers to define their application build, deploy, and release lifecycle as code, reducing the time to deliver deployments through a consistent and repeatable workflow."
arch=('x86_64')
url="https://www.waypointproject.io"
license=('MPL2')
depends=('glibc')
makedepends=('go' 'git' 'go-bindata')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/hashicorp/waypoint.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --always | sed 's/[- ]/_/g'
}

prepare() {
  mkdir -p gopath/src/github.com/hashicorp
  mkdir -p gopath/bin

  ln -rTsf ${_pkgname} gopath/src/github.com/hashicorp/${_pkgname}
  export GOPATH="$srcdir"/gopath
  export PATH="$PATH:$GOPATH/bin"
}

build() {
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd gopath/src/github.com/hashicorp/${_pkgname}
  make bin

  unset GOFLAGS
}

package() {
  cd gopath/src/github.com/hashicorp/${_pkgname}
  install -Dm755 waypoint "$pkgdir"/usr/bin/waypoint
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
