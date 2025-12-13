# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=grafana-bin
_pkgname=grafana
pkgver=12.3.0
_build_id=19497075765
pkgrel=1
pkgdesc='Gorgeous metric viz, dashboards & editors for Graphite, InfluxDB & OpenTSDB - binary version'
url='https://grafana.com/grafana/download?edition=oss'
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
source_x86_64=("https://dl.grafana.com/grafana/release/${pkgver}/grafana_${pkgver}_${_build_id}_linux_amd64.tar.gz")
source_armv6h=("https://dl.grafana.com/grafana/release/${pkgver}/grafana_${pkgver}_${_build_id}_linux_arm-6.tar.gz")
source_armv7h=("https://dl.grafana.com/grafana/release/${pkgver}/grafana_${pkgver}_${_build_id}_linux_arm-7.tar.gz")
source_aarch64=("https://dl.grafana.com/grafana/release/${pkgver}/grafana_${pkgver}_${_build_id}_linux_arm64.tar.gz")
sha256sums=('9e3637d00065b88e051f9950d836ea3ec69f21ab8ab452f3b99a4deb30d41efa'
            '9cbd46f771dae5e2308b991a00d07a25cc1765f9bdd4082726108e3476403b56'
            '3cd6026ba009e05f49ec265d049d590d4f35330c1f14cd90a468c8d588501675')
sha256sums_x86_64=('dd34d03f8dbf815f153b638b793e6ab1b9d205b7c0a15dddd851332f0c9ac01c')
sha256sums_armv6h=('b526b6eb39e515da0d83a56b792769ac56150fd461db764afe61c5217f2c6c02')
sha256sums_armv7h=('fc4615ba841c4b1bc7ba7e0c6770afe33dcd8d9daa1432348fa9eda5f13d25c5')
sha256sums_aarch64=('d7823bb36a89d2f14a002e0a0332515936fd0e732313e0dc44b12da669ee5ff8')

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
