# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescaledb-tune
pkgver=0.8.1
pkgrel=1
pkgdesc="A tool for tuning TimescaleDB for better performance"
arch=('x86_64')
url="https://github.com/timescale/timescaledb-tune"
license=('Apache')
depends=('postgresql')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('b981f89b187651b2fd1113bd6bbdbf8ed5484f34e352fd5de885921a82c48a5936c016def0700e903e06815560f4ba7f6978b36f6128aff855b5d86648bd3520')

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
