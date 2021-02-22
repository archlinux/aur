# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-snmp-exporter
_pkgname=snmp_exporter
pkgver=0.20.0
pkgrel=1
pkgdesc="Prometheus exporter for SNMP metrics"
arch=(x86_64)
url="https://github.com/prometheus/snmp_exporter"
license=(Apache)
makedepends=(go)
depends=(net-snmp glibc)
backup=("etc/conf.d/prometheus-snmp-exporter")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.conf"
        "$pkgname.service"
        "$pkgname.sysusers")
b2sums=('81c2c6e8b1f61fe322cf040910744857f0628b61172774069675f5702d7e8dcc443a5567d5fe9d3e26139fee87c3cae8ed5fb7ce21c13b8a0f0cab1cd76384aa'
        'a74e9f55489272ddd683f0c0a34b78d4c4f96173009db2e5334f00c3ad7d2d4ea27ca1aca4fba74cfac1e2a6110a02185bbe65222772e102b1c87fbebaccb9b2'
        'ac862a1fecc719c04684836b0c0e0aaff93912ad09f676555fc3212dcb8fa93bd4569550247fb0aaca9e7083e6d4707ebd7f6332d28ab14ba0774625fc176737'
        '08c063a6626e53100e971f10437a9dc17eeb962bedcd6c9e746ae0d336205c68991518103e0ca393d3711ca4d4394d65574e9c611bcc98e61b9224d3b5d5d6a7')

prepare() {
  cd "$_pkgname-$pkgver"
  go mod vendor
}

build() {
  cd "$_pkgname-$pkgver"
  mkdir build
  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X github.com/prometheus/common/version.Version=$pkgver \
    -X github.com/prometheus/common/version.Revision=$pkgver \
    -X github.com/prometheus/common/version.Branch=tarball \
    -X github.com/prometheus/common/version.BuildUser=someone@builder \
    -X github.com/prometheus/common/version.BuildDate=$(date -d@"$SOURCE_DATE_EPOCH" +%Y%m%d-%H:%M:%S)" \
    -o build ./generator .
}

package() {
  # systemd files
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$pkgname.conf" "$pkgdir/etc/conf.d/$pkgname"

  cd "$_pkgname-$pkgver"

  # binaries
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 build/generator "$pkgdir/usr/bin/${pkgname%exporter}generator"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # docs
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 snmp.yml "$pkgdir/usr/share/doc/$pkgname/snmp_example.yml"
  install -Dm644 generator/README.md "$pkgdir/usr/share/doc/$pkgname/GENERATOR_README.md"
}
