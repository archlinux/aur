pkgname=teslamate
pkgver=1.24.1
pkgrel=1
pkgdesc="A self-hosted data logger for your Tesla 🚘"
arch=('any')
url="https://testlamate.org"
license=("MIT")
depends=("elixir" "nodejs" "grafana" "postgresql")
makedepends=("npm")
source=("https://github.com/adriankumpf/teslamate/archive/refs/tags/v${pkgver}.tar.gz"
        "teslamate.service"
        "teslamate.install")
sha512sums=('1b9c95e06e4581731bad5b0a48e2b9476548c1c6f71361d03243f0c38401dae27f77d040c4023b508d69d42b7cb2c8309cc1f41383d0f2361a5bd0b6b6a47ca2'
            '92231f298529164d47109cf6d59e6c8ee7bd20ae4a49a30cb5f21b6ba501bb6e66afdadedf86d3a7ab7745deb0c36627cc89c7f197c8f312333c025a6b1c5e5b'
            '9f345a7ac9977b298af7620e75f8585e0d75502c394e165ac7e694baa6342ce0144e663d88c3d1e4af12ae4011afa8ef6dddbb006b4b463d23a1452b6abe79bc')
install=teslamate.install

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

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
  cd ${srcdir}/${pkgname}-${pkgver}
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
  cd ${srcdir}/${pkgname}-${pkgver}
  export HEX_HOME=${srcdir}/.hex
  export MIX_HOME=${srcdir}/.mix
  export MIX_ENV=prod

  mix do phx.digest, release --overwrite --path=${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/bin/teslamate ${pkgdir}/usr/bin/teslamate

  mkdir -p ${pkgdir}/etc/systemd/system
  install ${srcdir}/teslamate.service ${pkgdir}/etc/systemd/system/teslamate.service

  mkdir -p ${pkgdir}/var/lib/grafana/conf/provisioning
  cp -r ./grafana/dashboards ${pkgdir}/var/lib/grafana/conf/provisioning
  install grafana/dashboards.yml ${pkgdir}/var/lib/grafana/conf/provisioning/dashboards/teslamate.yml

  mkdir -p ${pkgdir}/var/lib/grafana/conf/provisioning/datasources
  install grafana/datasource.yml ${pkgdir}/var/lib/grafana/conf/provisioning/datasources/teslamate.yml
}

# vim:set ts=2 sw=2 et:
