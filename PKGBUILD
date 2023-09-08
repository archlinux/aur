# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=grafana-bin
_pkgname=grafana
pkgver=10.1.1
pkgrel=1
pkgdesc='Gorgeous metric viz, dashboards & editors for Graphite, InfluxDB & OpenTSDB - binary version'
url='https://grafana.com/'
conflicts=('grafana')
provides=('grafana')
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('AGPL' 'Apache')
install=${_pkgname}.install
backup=('etc/grafana.ini')
source=('grafana.service'
        'grafana.sysusers'
        'grafana.tmpfiles'
       )
install=$_pkgname.install
source_x86_64=("https://dl.grafana.com/oss/release/grafana-${pkgver}.linux-amd64.tar.gz")
source_armv6h=("https://dl.grafana.com/oss/release/grafana-${pkgver}.linux-armv6.tar.gz")
source_armv7h=("https://dl.grafana.com/oss/release/grafana-${pkgver}.linux-armv7.tar.gz")
source_aarch64=("https://dl.grafana.com/oss/release/grafana-${pkgver}.linux-arm64.tar.gz")
sha256sums=('fa1aefe885f2d94bb6a9f6e98eb793b8145f1a980357c809036dc00c9d25594f'
            '9cbd46f771dae5e2308b991a00d07a25cc1765f9bdd4082726108e3476403b56'
            '3cd6026ba009e05f49ec265d049d590d4f35330c1f14cd90a468c8d588501675')
sha256sums_x86_64=('9a3168007cc5cdd26c56d6121c4c163f9b6012435c87dacf3d3fa7914f9768f6')
sha256sums_armv6h=('633009b0dd4fa25cc0062f7d90addb020b83687c3d70866edcb31be8f8a1bd48')
sha256sums_armv7h=('7a5fb0e045117f9ebf7e7549085e1a554f4a15b32724c088afa05f4d16e02c56')
sha256sums_aarch64=('757f7a4974f776732b43e51a238019dc2cea346e2d22854d7f0202f05ad4d196')

prepare() {
  cd ${_pkgname}-${pkgver}
  # set arch linux paths
  sed -ri 's,^(\s*data\s*=).*,\1 /var/lib/grafana,' conf/defaults.ini
  sed -ri 's,^(\s*plugins\s*=).*,\1 /var/lib/grafana/plugins,' conf/defaults.ini
  sed -ri 's,^(\s*provisioning\s*=).*,\1 /var/lib/grafana/conf/provisioning,' conf/defaults.ini
  sed -ri 's,^(\s*logs\s*=).*,\1 /var/log/grafana,' conf/defaults.ini
}

package() {
  install -Dm644 grafana.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/grafana.conf"
  install -Dm644 grafana.sysusers "$pkgdir/usr/lib/sysusers.d/grafana.conf"
  install -Dm644 grafana.service "$pkgdir/usr/lib/systemd/system/grafana.service"

  cd ${_pkgname}-${pkgver}
  install -Dm755 bin/grafana-server "$pkgdir/usr/bin/grafana-server"
  install -Dm755 bin/grafana-cli "$pkgdir/usr/bin/grafana-cli"
  install -Dm755 bin/grafana "$pkgdir/usr/bin/grafana"
  install -Dm640 -o207 -g207 conf/sample.ini "$pkgdir/etc/grafana.ini"
  install -Dm644 conf/defaults.ini "$pkgdir/usr/share/grafana/conf/defaults.ini"
  install -dm755 "$pkgdir/usr/share/grafana/"
  cp -r public plugins-bundled "$pkgdir/usr/share/grafana/"

  # Remove unit tests
  rm -r "$pkgdir/usr/share/grafana/public/test"
}
