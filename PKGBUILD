# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale
pkgver=0.1.0.beta.5
_pkgver="${pkgver/.beta/-beta}" # temporary workaround, remove once package is out of beta
pkgrel=1
pkgdesc="An open source analytical platform for Prometheus metrics"
arch=('x86_64')
url="https://github.com/timescale/promscale"
license=('Apache')
makedepends=(go)
checkdepends=()
optdepends=(timescaledb prometheus)
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
b2sums=('d09d1a1652db28809d028ae2ba1537db23587110197e568a8c01f0ef8d14b298bc50c8a58ecf599560d23ae25cf5dca57599b2c865f20833e5f70ec76570d59f')

prepare() {
  cd "$pkgname-$_pkgver"
  go mod vendor
}

build() {
  cd "$pkgname-$_pkgver/cmd/$pkgname"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$_pkgver/cmd/$pkgname/$pkgname"
}
