# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale
pkgver=0.4.1
pkgrel=1
pkgdesc="An open source analytical platform for Prometheus metrics"
arch=('x86_64')
url="https://github.com/timescale/promscale"
license=('Apache')
depends=('glibc')
makedepends=('go')
optdepends=(
  'timescaledb'
  'prometheus'
  'promscale_extension'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  'systemd.service'
  'sysusers.conf'
)
b2sums=('1334e4be9fc5e58a1448309e0f8562c7ee2c08c3d757ead38e0eff3a849d5176ae89764c25a6cd70d73bea4c28a013b51296733c93c893548fa7249239e614a7'
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
  install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # documentation
  cd "$pkgname-$pkgver"
  install -Dm644 cmd/prom-migrator/README.md "$pkgdir/usr/share/doc/$pkgname/prom-migrator.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -r docs "$pkgdir/usr/share/doc/$pkgname"

  # binaries
  install -Dm755 -t "$pkgdir/usr/bin" \
    "build_output/$pkgname" \
    build_output/prom-migrator
}
