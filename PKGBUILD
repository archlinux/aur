# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=grafana-bin
_pkgname=grafana
pkgver=13.1.0
_pkgver=${pkgver}
_build_id=28013217238
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
source_x86_64=("https://dl.grafana.com/grafana/release/${_pkgver}/grafana_${_pkgver}_${_build_id}_linux_amd64.tar.gz")
source_armv6h=("https://dl.grafana.com/grafana/release/${_pkgver}/grafana_${_pkgver}_${_build_id}_linux_arm-6.tar.gz")
source_armv7h=("https://dl.grafana.com/grafana/release/${_pkgver}/grafana_${_pkgver}_${_build_id}_linux_arm-7.tar.gz")
source_aarch64=("https://dl.grafana.com/grafana/release/${_pkgver}/grafana_${_pkgver}_${_build_id}_linux_arm64.tar.gz")
sha256sums=('9e3637d00065b88e051f9950d836ea3ec69f21ab8ab452f3b99a4deb30d41efa'
            '9cbd46f771dae5e2308b991a00d07a25cc1765f9bdd4082726108e3476403b56'
            '3cd6026ba009e05f49ec265d049d590d4f35330c1f14cd90a468c8d588501675')
sha256sums_x86_64=('4f562bb224b8bb758b47789381babb284cb41687da8d714f2ff0e118e945e775')
sha256sums_armv6h=('4aa94ad3ef8b4881cc87a6850fbebc142bb4689090e9c5cd01d315d996b4290c')
sha256sums_armv7h=('4dd1c117d868b3e2c870618468e873fc98098ebc5093c99e6456b5a1a7660f81')
sha256sums_aarch64=('d5f98305792b917b173320d5fde6b394685ae5df179ae9f9a8f22b56436b389a')

prepare() {
  cd ${_pkgname}-${_pkgver}
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
  install -Dm755 bin/grafana "$pkgdir/usr/bin/grafana"
  install -Dm640 -o207 -g207 conf/sample.ini "$pkgdir/etc/grafana.ini"
  install -Dm644 conf/defaults.ini "$pkgdir/usr/share/grafana/conf/defaults.ini"
  install -dm755 "$pkgdir/usr/share/grafana/"
  cp -r public plugins-bundled "$pkgdir/usr/share/grafana/"

  # Remove unit tests
  rm -r "$pkgdir/usr/share/grafana/public/test"

  # Source maps are only useful for frontend debugging and add substantial size.
  find "$pkgdir/usr/share/grafana/public" -type f -name '*.js.map' -delete
  find "$pkgdir/usr/share/grafana/public" -type f -name '*.js' -exec \
    sed -i '/^\/\/# sourceMappingURL=.*\.js\.map$/d' {} +
}
