# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=timescaledb-backup
pkgver=0.1.1
pkgrel=2
pkgdesc="A tool for dumping and restoring TimescaleDB databases"
arch=('x86_64')
url="https://github.com/timescale/timescaledb-backup"
license=('custom:TSL')
depends=('timescaledb' 'glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "https://raw.githubusercontent.com/timescale/timescaledb/master/tsl/LICENSE-TIMESCALE")
b2sums=('ab84cac38b68fd82cf986394ebfa51019cac5075c151e900257164d4372c0d7304564ef6ef8bdcc29f93153d878d6af75092c881a1b0b6876015200a7e2e20fb'
        '32bf2e976bf68df573329b3e83fe0060557f1c09859dc12f1c1070e6c2ecb29ee9699e981900e39b3a3ccd41384d28ab7a81bcc953e0d34f00d0048d0f1ea028')

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
  install -Dm755 -t "$pkgdir/usr/bin" build/ts-dump build/ts-restore

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$srcdir/LICENSE-TIMESCALE" LICENSE NOTICE

  # documentation
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
