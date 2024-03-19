# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Maintainer: Vladislav Minakov <v@minakov.pro>
# Contributor: Sandy Carter <bwrsandman [at] gmail dot com>

pkgname=teslamate
pkgver=1.28.4
pkgrel=1
pkgdesc="A self-hosted data logger for your Tesla"
arch=('any')
url="https://teslamate.org"
license=("MIT")
makedepends=("npm" "elixir" "nodejs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/teslamate-org/teslamate/archive/refs/tags/v${pkgver}.tar.gz"
        "teslamate.conf"
        "teslamate.service"
        "teslamate.sysusers"
        "teslamate.install"
        "teslamate.tmpfiles")
sha512sums=('eb94f78d111e4fc9f41d15f40d860827830be036fb1140f123463ef854fdbc84fd0515f3030c735b1bca72d5f17622ef0d0e69a275149cfa0895bc4659cac8c4'
            '09e43822410d04a92d407474e677efdf4c46642244a37dd429fbfe234b12a8f3ae938717dcbb5d18e92f71fa73e75674f1c7324a7633f3d3abf070e605fe4563'
            'fd306d395b9c5f5c7e0a4e17015235ef674e24fcd7022538872f8661e1964e23b12ed4b27335755b666a3e5fd9aef3e47e94436f1068e6f5908a27507cf7ffcb'
            'bfb718592f7ca86049f81f1b8b9efae4bbcf600846d0c3d14d965a8062c9a571d0243768fd753052d62fe4c690c76c5f28171c9a7a50ff4219149f49a489f128'
            '3fceac6686975feed7162f06f5a87eefd7fcee5caa0c68ba12cbda3fe0ad531e575d2ef1feccbf0b0445379ea5fae00ccc0a09497ba6116d6cd926865c041c69'
            '6321ecf0d88206a962078c264b166ce10f8089bc252d4ca4d78810100fefd5d3e675b3d4fcc4f09d3ca929f8937966699be9447872131b82fe3acade0262ff5b')
backup=('etc/teslamate.conf')
install=teslamate.install

build() {
  cd "$pkgname-$pkgver"
  sed -i -e '/teslamate_internal/,$d' -e 's,/dashboards,/var/lib/grafana/conf/provisioning/dashboards,g' grafana/dashboards.yml
  export HEX_HOME=${srcdir}/.hex
  export MIX_HOME=${srcdir}/.mix
  export MIX_ENV=prod
  mix local.hex --force
  mix local.rebar --force
  mix deps.get --only prod
  npm install --cache "${srcdir}/.npm" --prefix ./assets
  npm run deploy --cache "${srcdir}/.npm" --prefix ./assets
}

package() {
  depends+=("grafana" "postgresql")
  cd "$pkgname-$pkgver"
  HEX_HOME=${srcdir}/.hex MIX_HOME=${srcdir}/.mix MIX_ENV=prod mix do phx.digest, release --overwrite --path=${pkgdir}/usr/share/webapps/${pkgname}
  install -Dm 644 "${srcdir}/teslamate.service" "${pkgdir}/usr/lib/systemd/system/teslamate.service"
  install -Dm 644 "${srcdir}/teslamate.sysusers" "${pkgdir}/usr/lib/sysusers.d/teslamate.conf"
  install -Dm 644 "${srcdir}/teslamate.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/teslamate.conf"
  install -Dm 644 grafana/dashboards.yml ${pkgdir}/var/lib/grafana/conf/provisioning/dashboards/teslamate.yml
  cp -r grafana/dashboards ${pkgdir}/var/lib/grafana/conf/provisioning
#  install -dm 750 "grafana/dashboards/" "${pkgdir}/var/lib/grafana/conf/provisioning/"
#  install -Dm 644 grafana/dashboards.yml ${pkgdir}/var/lib/grafana/conf/provisioning/dashboards/teslamate.yml
  install -Dm 644 grafana/datasource.yml ${pkgdir}/var/lib/grafana/conf/provisioning/datasources/teslamate.yml
}
