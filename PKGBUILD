# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale
pkgver=0.1.2
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
b2sums=('761e00de8829fae2a6b5f2b9c6b7e1db0f3b4391076af4df2faebb02186707ed25c75ef52020b6e43eebfac414db2ee7c26bcfd535de748697ff56e7639f0408')

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
