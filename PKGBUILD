# Maintainer: David Birks <david@tellus.space>

pkgname=auger-git
pkgver=r54.63a4e8a
pkgrel=1
pkgdesc="Tool to directly access data objects stored in etcd by Kubernetes"
url="https://github.com/jpbetz/auger"
license=('Apache')
arch=('x86_64')
source=('auger-git::git+https://github.com/jpbetz/auger')
makedepends=('git' 'go')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # LDFLAGS into the GOFLAGS env variable.
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

  cd "$srcdir/$pkgname"
  make build
}

package() {
  install -Dm 755 "$srcdir/$pkgname/build/auger" "$pkgdir/usr/bin/auger"
}
