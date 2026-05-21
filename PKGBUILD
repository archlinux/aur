# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: Gilles Hamel <hamelg at laposte dot net>
# Contributor: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=grafana-bin
_pkgname=grafana
pkgver=13.0.1
_pkgver=13.0.1+security-01
_build_id=25720641773
pkgrel=4
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
sha256sums_x86_64=('18cf05e98afb786ef9c2ad4cc77db628a1449672b262a7f1fc1d5211b780965c')
sha256sums_armv6h=('f496b5f89d56dd7042d0530e36581d8374fa3ec57cebce65f820a1c8c065a291')
sha256sums_armv7h=('50be251ff259ebb45264cc5370ded71dcb08414c31023e972996e7028d239a58')
sha256sums_aarch64=('d01a3660bd020faf838cfcc72f793e50bffc261a81e88d42829f2623aced3201')

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
