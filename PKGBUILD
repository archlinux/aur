# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=grafana-bin
_pkgname=grafana
pkgver=8.2.0
pkgrel=1
pkgdesc="A general purpose dashboard and graph composer. It supports graphite, influxdb or opentsdb - binary version"
url="http://grafana.org"
conflicts=('grafana')
provides=('grafana')
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('Apache')
install=${_pkgname}.install
backup=("etc/${_pkgname}/${_pkgname}.ini")
source=("grafana.service")
source_x86_64=("https://dl.grafana.com/oss/release/grafana-${pkgver}.linux-amd64.tar.gz")
source_armv6h=("https://dl.grafana.com/oss/release/grafana-${pkgver}.linux-armv6.tar.gz")
source_armv7h=("https://dl.grafana.com/oss/release/grafana-${pkgver}.linux-armv7.tar.gz")
source_aarch64=("https://dl.grafana.com/oss/release/grafana-${pkgver}.linux-arm64.tar.gz")
sha256sums=('07512df687b1cf622c1a71b67f3cdf286ba02d7b87a844a4c51f89e0228074f2')
sha256sums_x86_64=('0c76cc731988704d7b5dc6a7fb808767126f3fdc6e294ba2c4e367451adf0828')
sha256sums_armv6h=('76ea473fffaa02db714efc92548c4e99d3d5c5f5307b238de954983314d219f6')
sha256sums_armv7h=('acd402b9373db491ffe8bfcdec95986021f21f2d08ac0ec85c08d54aa8bda83b')
sha256sums_aarch64=('2d9ff8c787c95533fc772359ebc4eac4d0d60b411bddb8bb05d34585c9f45b2e')

package() {
  install -Dm644 "${srcdir}/grafana.service" "$pkgdir/usr/lib/systemd/system/grafana.service"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -dm755 "${pkgdir}/var/lib/grafana"
  install -dm755 "${pkgdir}/var/log/grafana"
  install -Dm755 bin/grafana-server "$pkgdir/usr/bin/grafana-server"
  install -Dm755 bin/grafana-cli "$pkgdir/usr/bin/grafana-cli"
  sed -i '/^;data = /c\data = /var/lib/grafana' conf/sample.ini
  sed -i '/^;logs = /c\logs = /var/log/grafana' conf/sample.ini
  install -Dm644 conf/sample.ini "$pkgdir/etc/${_pkgname}/${_pkgname}.ini"
  install -Dm644 conf/defaults.ini "$pkgdir/usr/share/grafana/conf/defaults.ini"
  cp -r public scripts plugins-bundled "$pkgdir/usr/share/grafana/"
}
