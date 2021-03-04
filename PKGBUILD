# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescaledb-tune
pkgver=0.11.0
pkgrel=1
pkgdesc="A tool for tuning TimescaleDB for better performance"
arch=('x86_64')
url="https://github.com/timescale/timescaledb-tune"
license=('Apache')
depends=('postgresql' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('e3898ce8b30f833865ec7e11974c0f199389e21ad24d48885c395091342e10c1d249ecb8288c386208acffdd6c4847e2ef72192c145fc9cc080f40d01be0fda8')

prepare() {
  cd "$pkgname-$pkgver"
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver/cmd/timescaledb-tune"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}"
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/$pkgname-$pkgver/cmd/timescaledb-tune/timescaledb-tune"
}
