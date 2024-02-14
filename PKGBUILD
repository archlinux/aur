# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Sandy Carter <bwrsandman [at] gmail dot com>

pkgname=teslamate
pkgver=1.28.3
pkgrel=1
pkgdesc="A self-hosted data logger for your Tesla 🚘"
arch=('any')
url="https://teslamate.org"
license=("MIT")
depends=("elixir" "nodejs" "grafana" "postgresql")
makedepends=("npm")
source=("$pkgname-$pkgver.tar.gz::https://github.com/teslamate-org/teslamate/archive/refs/tags/v${pkgver}.tar.gz"
        "teslamate.service"
        "teslamate.install")
sha256sums=('d6743b3f11bab83bc96e32e674b3e441d37e41c15e8c1ce876a9535c4d5abccf'
            '455b9f75b17ee31bfed34fb3b7ab149947e7691b3b1c07c51eb298d0ac4adf67'
            '1f599b27539320c874e55d3430c8375179a69893c38e10d0fed7952450a3f347')
install=teslamate.install

prepare() {
  cd "$pkgname-$pkgver"

  sed -i 's,grafana-map-panel,grafana-worldmap-panel,g' grafana/dashboards/charging-stats.json

  sed -i 's,/dashboards_reports,/dashboards/reports,g' grafana/dashboards.yml
  sed -i 's,/dashboards_internal,/dashboards/internal,g' grafana/dashboards.yml
  sed -i 's,/dashboards,/var/lib/grafana/conf/provisioning/dashboards,g' grafana/dashboards.yml

  sed -i 's,$DATABASE_HOST,localhost,g' grafana/datasource.yml
  sed -i 's,$DATABASE_PORT,5432,g' grafana/datasource.yml
  sed -i 's,$DATABASE_NAME,teslamate,g' grafana/datasource.yml
  sed -i 's,$DATABASE_USER,teslamate,g' grafana/datasource.yml
  sed -i 's,$DATABASE_PASS,secret,g' grafana/datasource.yml
}

build() {
  cd "$pkgname-$pkgver"
  export HEX_HOME=${srcdir}/.hex
  export MIX_HOME=${srcdir}/.mix
  export MIX_ENV=prod

  mix local.hex --force
  mix local.rebar --force
  mix deps.get --only prod
  npm install --cache "${srcdir}/.npm" --prefix ./assets
  npm run deploy --cache "${srcdir}/.npm" --prefix ./assets

  mix do phx.digest, release --overwrite
}

package() {
  cd "$pkgname-$pkgver"
  export HEX_HOME=${srcdir}/.hex
  export MIX_HOME=${srcdir}/.mix
  export MIX_ENV=prod

  mix do phx.digest, release --overwrite --path=${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/bin/teslamate ${pkgdir}/usr/bin/teslamate

  mkdir -p ${pkgdir}/etc/systemd/system
  install ${srcdir}/teslamate.service ${pkgdir}/etc/systemd/system/teslamate.service

  mkdir -p ${pkgdir}/var/lib/grafana/conf/provisioning
  cp -r grafana/dashboards ${pkgdir}/var/lib/grafana/conf/provisioning
  install grafana/dashboards.yml ${pkgdir}/var/lib/grafana/conf/provisioning/dashboards/teslamate.yml

  mkdir -p ${pkgdir}/var/lib/grafana/conf/provisioning/datasources
  install grafana/datasource.yml ${pkgdir}/var/lib/grafana/conf/provisioning/datasources/teslamate.yml
}

# vim:set ts=2 sw=2 et:
