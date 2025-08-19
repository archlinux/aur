# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Maintainer: Vladislav Minakov <v@minakov.pro>
# Contributor: Sandy Carter <bwrsandman [at] gmail dot com>

pkgname=teslamate
pkgver=2.1.1
pkgrel=1
pkgdesc="A self-hosted data logger for your Tesla"
arch=('any')
url="https://github.com/teslamate-org/teslamate"
license=("MIT")
makedepends=("npm" "elixir" "nodejs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/teslamate-org/teslamate/archive/refs/tags/v${pkgver}.tar.gz"
        "teslamate.conf"
        "teslamate.service"
        "teslamate.sysusers"
        "teslamate.install"
        "teslamate.tmpfiles")
sha512sums=('d201ffcfdd5d68925547fc3ca7c143c9a44cc987f1d19dbaaddcb17a9aedcbda8905e33878f01b8b724d0fc904782433e9ec4e246cc923b332a27726fbfdd6ed'
            '531334833f358ffbc39948a59bd73b2a8e0977677b54432f168cb5df6e5a3bfa706a4bd4e5099bb787b8b92eab96be74835d09b6c5a708bc3c40daecf38b01b3'
            'fd306d395b9c5f5c7e0a4e17015235ef674e24fcd7022538872f8661e1964e23b12ed4b27335755b666a3e5fd9aef3e47e94436f1068e6f5908a27507cf7ffcb'
            'bfb718592f7ca86049f81f1b8b9efae4bbcf600846d0c3d14d965a8062c9a571d0243768fd753052d62fe4c690c76c5f28171c9a7a50ff4219149f49a489f128'
            '3fceac6686975feed7162f06f5a87eefd7fcee5caa0c68ba12cbda3fe0ad531e575d2ef1feccbf0b0445379ea5fae00ccc0a09497ba6116d6cd926865c041c69'
            '959476ef8b5641eaf996392a49eefe8530a821240d956f08af7059acb99bee64e23bcfc5a3540bcf1efa10c3a3ee072b0a58e128d2a7ea6c989c329bb3228014')
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
  install -Dm 644 "${srcdir}/teslamate.conf" "${pkgdir}/etc/teslamate.conf"
  install -Dm 644 "${srcdir}/teslamate.service" "${pkgdir}/usr/lib/systemd/system/teslamate.service"
  install -Dm 644 "${srcdir}/teslamate.sysusers" "${pkgdir}/usr/lib/sysusers.d/teslamate.conf"
  install -Dm 644 "${srcdir}/teslamate.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/teslamate.conf"
  install -Dm 644 grafana/dashboards.yml ${pkgdir}/var/lib/grafana/conf/provisioning/dashboards/teslamate.yml
  cp -r grafana/dashboards ${pkgdir}/var/lib/grafana/conf/provisioning
#  install -dm 750 "grafana/dashboards/" "${pkgdir}/var/lib/grafana/conf/provisioning/"
#  install -Dm 644 grafana/dashboards.yml ${pkgdir}/var/lib/grafana/conf/provisioning/dashboards/teslamate.yml
  install -Dm 644 grafana/datasource.yml ${pkgdir}/var/lib/grafana/conf/provisioning/datasources/teslamate.yml
}
