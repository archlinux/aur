# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=grafana-bin
_pkgname=grafana
pkgver=8.0.2
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
sha256sums_x86_64=('4013062cddcc8d825cbf6bdbb3d1877eb0a2c5c57b9c7f8ec77a3afd8b5161a9')
sha256sums_armv6h=('0a5c1c730a3037957e72f66ee211dccac5f099f2725b5607df19b6a2324fc89c')
sha256sums_armv7h=('9e8b6c647024ffe39f6504eb602f651b10200838272d176edb113d1ed75ad021')
sha256sums_aarch64=('078300c68e7513dd167456f6a8930feeacfb6511fe02d562e695b06e0290b0bc')

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
