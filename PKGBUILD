# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=ytt
pkgver=0.46.0
pkgrel=1
pkgdesc="YAML templating tool that works on YAML structure instead of text"
url="https://carvel.dev/ytt/"
license=('Apache')
arch=('x86_64')
makedepends=('zip' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/carvel-dev/ytt/archive/v$pkgver.tar.gz")
sha256sums=('946e9863f71db822ef6e19631237b66aca8332b5ceb85d111ad35841c3bb978b')

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
