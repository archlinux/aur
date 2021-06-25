# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescaledb-backup
_tsdb_version=2.3.0
pkgver=0.1.1
pkgrel=3
pkgdesc="A tool for dumping and restoring TimescaleDB databases"
arch=('x86_64')
url="https://github.com/timescale/timescaledb-backup"
license=('custom:TSL')
depends=('timescaledb')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "LICENSE-TIMESCALE-$_tsdb_version::https://raw.githubusercontent.com/timescale/timescaledb/$_tsdb_version/tsl/LICENSE-TIMESCALE")
b2sums=('ab84cac38b68fd82cf986394ebfa51019cac5075c151e900257164d4372c0d7304564ef6ef8bdcc29f93153d878d6af75092c881a1b0b6876015200a7e2e20fb'
        '9ae11a930e930953b16f7d6d1d3fbf0ebb6c4d8687cac1475560603442ed8edd452200468f7fe9c82af651d40ccad192c036940bfe57ef093e7c30cce93383f0')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build
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
  cd "$pkgname-$pkgver"

  # binaries
  install -vDm755 -t "$pkgdir/usr/bin" build/*

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE NOTICE
  install -vDm644 "$srcdir/LICENSE-TIMESCALE-$_tsdb_version" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-TIMESCALE"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
