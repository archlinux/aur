# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescaledb-tune
pkgver=0.10.0
pkgrel=1
pkgdesc="A tool for tuning TimescaleDB for better performance"
arch=('x86_64')
url="https://github.com/timescale/timescaledb-tune"
license=('Apache')
depends=('postgresql')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('751427dd75f1d235b8ccd222b0d1eece9d9cb61804458e1fa8d80f5b4413a2ddcb0e5f149e7e1a24e705f571a409130965c43723402ccc2fb66f2d4c4744f917')

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
