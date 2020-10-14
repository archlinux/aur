# Maintainer: Dasith Gunawardhana <dasith@dg10a.com>

_pkgname=boundary
pkgname=${_pkgname}-git
pkgver=v0.1.0_17_gf008dff9
pkgrel=1
pkgdesc="Boundary is an open source solution that automates a secure identity-based user access to hosts and services across environments."
arch=('x86_64')
url="https://www.boundaryproject.io"
license=('MPL2')
depends=('glibc')
makedepends=('go' 'git' 'go-bindata' 'go-tools')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/hashicorp/boundary.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe | sed 's/[- ]/_/g'
}

prepare() {
  mkdir -p gopath/src/github.com/hashicorp
  mkdir -p gopath/bin

  ln -rTsf ${_pkgname} gopath/src/github.com/hashicorp/${_pkgname}
  export GOPATH="$srcdir"/gopath
  export PATH="$PATH:$GOPATH/bin"

  cd gopath/src/github.com/hashicorp/${_pkgname}
  make tools
}

build() {
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd gopath/src/github.com/hashicorp/${_pkgname}
  make dev

  unset GOFLAGS
}

package() {
  cd gopath/src/github.com/hashicorp/${_pkgname}
  install -Dm755 bin/boundary "$pkgdir"/usr/bin/boundary
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
