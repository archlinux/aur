# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=promscale
pkgver=0.5.1
pkgrel=2
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
b2sums=('dc9eea677ad62d1bdb85b4dae9fa4580a0855be0f44ec03f85ef28e0e127b8752bee585a8695cc6b29f75f058ce1de314ad909e19d73b04e316ba6f984e20437'
        '98ad7412c94ff5a6643e9eec7a1cf4c7828ef84b25ec18b4469b70cc11ccbe933cde4e822c9b33977ae8bb25bf10de6baef13f84a83bde82b3922c7056f2f712'
        '2fae9c07cd255528a1c87062650956b857caa8a3c656b59e85d740f527433f510a8fe18025e03480d9145673e6dd03867d60ead5a48044353262105a173cbbfd')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir build_output
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

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
