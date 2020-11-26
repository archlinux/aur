# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>


pkgname=grafana-bin
_pkgname=grafana
pkgver=7.3.4
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
sha256sums_x86_64=('9343b2b7c8784fa7ac62f03137bcf05f114bef404d2d57dc6f5cbcb61cd3aeba')
sha256sums_armv6h=('62841df7ee3b35eb9f7237717f3fc63d72b2b17235888222a6eb5316675c5cf6')
sha256sums_armv7h=('2c4a22e9a728dcf544b95f2f9d910bb86818a092255208d8fbbc813ae4ce1e8a')
sha256sums_aarch64=('ffdf0dc3b96f11136ad894206b492efce4df6da33ee5e446dd7b91bf7d8da17b')


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
