# Maintainer: David Birks <david@tellus.space>

pkgname=auger-git
pkgver=r47.3e36b65
pkgrel=1
pkgdesc="Tool to directly access data objects stored in etcd by Kubernetes"
url="https://github.com/jpbetz/auger"
license=('Apache')
arch=('x86_64')
source=('auger-git::git+https://github.com/jpbetz/auger')
makedepends=('git' 'go' 'glide')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p gopath/src/github.com/jpbetz
  ln -rTsf $pkgname gopath/src/github.com/jpbetz/auger

}

build() {
  # LDFLAGS into the GOFLAGS env variable.
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/jpbetz/auger
  make build
}

package() {
  install -Dm 755 "${srcdir}/gopath/src/github.com/jpbetz/auger/build/auger" "${pkgdir}/usr/bin/auger"
}
