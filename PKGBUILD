# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: George Tsiamasiotis <gtsiam@pm.me>
# Contributor: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=ytt
pkgver=0.45.4
pkgrel=1
pkgdesc="YAML templating tool that works on YAML structure instead of text"
url="https://carvel.dev/ytt/"
license=('Apache')
arch=('x86_64')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/carvel-dev/ytt/archive/v$pkgver.tar.gz")
sha256sums=("e4c8cd61879c83b41706fc969b0666fe5d69fecd259bb12a010ed9d9d98baa92")

prepare() {
  cd "$pkgname-$pkgver"

  # Patch the buildscript to have the correct version
  sed -i "/^LATEST_GIT_TAG=/c\\LATEST_GIT_TAG=$pkgver" ./hack/build.sh
}

build() {
  cd "$pkgname-$pkgver"

  export GOPATH="$srcdir"/go
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  ./hack/build.sh
}

package() {
	cd "$pkgname-$pkgver"

  install -Dm 755 ./ytt "$pkgdir/usr/bin/ytt"
}
