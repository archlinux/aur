# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Crowdsec Team <debian@crowdsec.net>

pkgname=crowdsec-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="The open-source and participative security solution offering crowdsourced protection against malicious IPs and access to the most advanced real-world CTI"
arch=('any')
url="https://github.com/crowdsecurity/crowdsec"
license=('MIT')
provides=('crowdsec')
conflicts=('crowdsec')
install=crowdsec-bin.install
depends=(
  'ca-certificates'
  'glibc'
  'sqlite'
  'systemd'
)
makedepends=(
  sed
  findutils
)
optdepends=(
  'docker: for running in docker mode'
)
backup=(
  etc/crowdsec/config.yaml
  etc/crowdsec/dev.yaml
  etc/crowdsec/user.yaml
  etc/crowdsec/acquis.yaml
  etc/crowdsec/profiles.yaml
  etc/crowdsec/simulation.yaml
  etc/crowdsec/console.yaml
  etc/crowdsec/local_api_credentials.yaml
  etc/crowdsec/online_api_credentials.yaml
)
source=(
  "$pkgname-v${pkgver}.tgz"::$url/releases/download/v${pkgver}/crowdsec-release.tgz
  crowdsec.sysusers
)
sha256sums=('4b318d4a301cb9c88d53a7455d752343112540b88d85c46a63b1fc79f8d712ab'
            'a97e2c4bc07470dad890fca27b6da7c4a9ac9762551a0888dd812d2da63200ad')

prepare() {
  cd "$srcdir/crowdsec-v${pkgver}"
  sed -ie 's|plugin_dir:.*|plugin_dir: /usr/lib/crowdsec/plugins/|' config/config.yaml
  sed -ie 's|usr/local/bin/crowdsec|usr/bin/crowdsec|' config/crowdsec.service
  find ./config -type f -regex '.*_win_?.*\.yaml' -delete
}

package() {
  cd "$srcdir/crowdsec-v${pkgver}"
  # create directories
  install -dm755 $pkgdir{/usr/lib/{crowdsec/plugins,systemd/system,sysusers.d},/etc/crowdsec{,/hub,/notifications,/console,/acquis.d,/scenarios,/postoverflows,/collections,/bouncers,/metabase},/usr/bin,/opt/crowdsec/}
  install -dm700 "$pkgdir/var/lib/crowdsec/data/"

  # config
  install -m644 ./config/{console,profiles,simulation,acquis,dev,user}.yaml -t $pkgdir/etc/crowdsec/
  install -m600 ./config/{config,local_api_credentials,online_api_credentials}.yaml -t $pkgdir/etc/crowdsec/
  install -m600 ./config/detect.yaml $pkgdir/var/lib/crowdsec/data/detect.yaml
  cp -R ./config/patterns $pkgdir/etc/crowdsec/

  # systemd
  install -m640 ./config/crowdsec.service $pkgdir/usr/lib/systemd/system/crowdsec.service

  # executables
  install -m755 ./cmd/{crowdsec-cli/cscli,crowdsec/crowdsec} -t $pkgdir/usr/bin/

  # plugins
  for name in http slack splunk email sentinel file; do
    folder="./cmd/notification-${name}/notification-${name}"
    conf="./cmd/notification-${name}/${name}.yaml"

    install -m755 "$folder" "$pkgdir/usr/lib/crowdsec/plugins/"
    install -m600 "$conf" "$pkgdir/etc/crowdsec/notifications/"
  done

  # extras
  install -m640 ./config/crowdsec.cron.daily -t $pkgdir/opt/crowdsec/
  install -m750 ./wizard.sh -t $pkgdir/opt/crowdsec/
  install -m644 "$srcdir/crowdsec.sysusers" "$pkgdir/usr/lib/sysusers.d/crowdsec.conf"
}
