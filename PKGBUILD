# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale
pkgver=0.1.0
#_pkgver="${pkgver/.beta/-beta}" # temporary workaround, remove once package is out of beta
pkgrel=1
pkgdesc="An open source analytical platform for Prometheus metrics"
arch=('x86_64')
url="https://github.com/timescale/promscale"
license=('Apache')
makedepends=(go)
checkdepends=()
optdepends=(timescaledb prometheus)
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('36248e3a5371eab977a5e156ab82177875550af934461e5f0cfcccf4e8704385670e14231ad390118394e22febcee2df8702aff3be23f6f586c9d500ee1bcffc')

prepare() {
  cd "$pkgname-$pkgver"
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver/cmd/$pkgname"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/cmd/$pkgname/$pkgname"
}
