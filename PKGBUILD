# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale
pkgver=0.5.0
pkgrel=1
pkgdesc="An open source analytical platform for Prometheus metrics"
arch=('x86_64')
url="https://github.com/timescale/promscale"
license=('Apache')
makedepends=('go')
optdepends=(
  'timescaledb: for a local timescaledb instance'
  'prometheus: for a local prometheus instance'
  'promscale_extension: for optimised postgresql extension'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  'systemd.service'
  'sysusers.conf'
)
b2sums=('36cd4fdf56f76108bd3f0c81a46641f684cb274013304c48b1ebfa855b4af64da8f3191299a247db95d030cf73229efd4dcf0ed48e7f60a00168aef11d025bf8'
        '98ad7412c94ff5a6643e9eec7a1cf4c7828ef84b25ec18b4469b70cc11ccbe933cde4e822c9b33977ae8bb25bf10de6baef13f84a83bde82b3922c7056f2f712'
        '2fae9c07cd255528a1c87062650956b857caa8a3c656b59e85d740f527433f510a8fe18025e03480d9145673e6dd03867d60ead5a48044353262105a173cbbfd')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir build_output
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build_output ./cmd/...
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # documentation
  cd "$pkgname-$pkgver"
  install -vDm644 cmd/prom-migrator/README.md "$pkgdir/usr/share/doc/$pkgname/prom-migrator.md"
  install -vDm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"

  # binaries
  install -vDm755 -t "$pkgdir/usr/bin" \
    "build_output/$pkgname" \
    build_output/prom-migrator
}
