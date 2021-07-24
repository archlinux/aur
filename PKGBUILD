# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescaledb-tune
pkgver=0.11.1
pkgrel=1
pkgdesc="A tool for tuning TimescaleDB for better performance"
arch=('x86_64')
url="https://github.com/timescale/timescaledb-tune"
license=('Apache')
depends=('postgresql')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('8b5b4a1b06281afe67ab326b3fddbdc86b89378e18eeae16b35f87f0839ce1c3b4ac1fedc251ea19be3db6a193c9df9b7f96660b9f96f7bc4ad97fad32a34bf8')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir build
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build \
    ./cmd/...
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/build/$pkgname"
}
