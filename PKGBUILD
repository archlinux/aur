# Maintainer: George Tsiamasiotis <gtsiam@pm.me>
# Contributor: David Birks <david@birks.dev>

pkgname=kapp
pkgdesc='A simple deployment tool focused on the concept of a Kubernetes application'
pkgver=0.59.0
pkgrel=1
provides=('kapp')
conflicts=('kapp')
arch=('x86_64')
license=('Apache')
url="https://carvel.dev/kapp/"
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/carvel-dev/kapp/archive/v$pkgver.tar.gz")
sha256sums=('f95eea6e5093a9a027f413879f1dcdd375ea4a093bbb2b9a39fbabb8b0a54425')

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

