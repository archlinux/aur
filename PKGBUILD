# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=grafana-bin
_pkgname=grafana
pkgver=7.5.6
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
sha256sums_x86_64=('dfa68869989c3607c106f8b8870209b273d36198dc47e7b229de84d048dddcd7')
sha256sums_armv6h=('f784c4dc1b2de0bcd9409d53dce2445afa6b96be9397cc2e73cd319565ca0e3f')
sha256sums_armv7h=('11bc24bb76e0ad17333faee559d25b9a3ce5784d1b6684a8d2f6133799e5651d')
sha256sums_aarch64=('0c25b63e64df694fd740a00abf016fa065d4f34ce2a6a1b85bb18ce4c0fe4476')

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
