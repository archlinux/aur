# Maintainer: George Tsiamasiotis <gtsiam@pm.me>
# Contributor: David Birks <david@birks.dev>

pkgname=kapp
pkgdesc='A simple deployment tool focused on the concept of a Kubernetes application'
pkgver=0.59.1
pkgrel=1
provides=('kapp')
conflicts=('kapp')
arch=('x86_64')
license=('Apache')
url="https://carvel.dev/kapp/"
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/carvel-dev/kapp/archive/v$pkgver.tar.gz")
sha256sums=('43a235d11b08b7cde61cb5d9a85fd3b96247983ce935204b9e9f95e883cc2795')

prepare() {
  cd "$pkgname-$pkgver"

  # Patch the buildscript to have the correct version
  sed -i "/^VERSION/c\\VERSION=$pkgver" ./hack/build.sh
}

build() {
  cd "$pkgname-$pkgver"

  export GOPATH="$srcdir"/go
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  ./hack/build.sh
}

check() {
  cd "$pkgname-$pkgver"

  ./hack/test.sh
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 ./kapp "$pkgdir/usr/bin/kapp"
}
