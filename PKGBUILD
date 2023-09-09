# Maintainer: George Tsiamasiotis <gtsiam@pm.me>
# Contributor: David Birks <david@birks.dev>

pkgname=kapp
pkgdesc='A simple deployment tool focused on the concept of a Kubernetes application'
pkgver=0.58.0
pkgrel=1
provides=('kapp')
conflicts=('kapp')
arch=('x86_64')
license=('Apache')
url="https://carvel.dev/kapp/"
depends=('kubectl')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/carvel-dev/kapp/archive/v$pkgver.tar.gz")
sha256sums=('f9e8aec13f51e9ff37273f99858c1683709d9756d6602ce697cfea646e37d19c')

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

