# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Crowdsec Team <debian@crowdsec.net>

pkgname=crowdsec-bin
pkgver=1.7.3
pkgrel=3
pkgdesc="An open-source, lightweight agent to detect and respond to bad behaviors. It also automatically benefits from our global community-wide IP reputation database"
arch=('any')
url="https://github.com/crowdsecurity/crowdsec"
license=('MIT')
provides=('crowdsec')
conflicts=('crowdsec')
install=crowdsec-bin.install
depends=(
  'ca-certificates'
  'coreutils'
  'sqlite'
  'systemd'
)
makedepends=(
  sed
  findutils
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
  crowdsec-hubupdate.service
  crowdsec-hubupdate.timer
  hubupdate.sh
)
sha256sums=('f2261585329556cf19049c43dd15e05edf304deec485f319826cb378ff8db9b3'
            'a97e2c4bc07470dad890fca27b6da7c4a9ac9762551a0888dd812d2da63200ad'
            '7267338c60bdbd11d61aa7cdefedccb610756e4dedc038ee5cc13303e2241a90'
            '135420c67f937574f45610b0dbeaf1ca7537055b473f80401b78a41165fd40f1'
            'b67441c0532bb899ffbd0b9fd11454e2ff1fea64f86a8da5170178704b750838')

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
  install -m640 $srcdir/crowdsec-hubupdate.{service,timer} -t $pkgdir/usr/lib/systemd/system/

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
  install -m750 $srcdir/hubupdate.sh -t $pkgdir/opt/crowdsec/
  install -m644 "$srcdir/crowdsec.sysusers" "$pkgdir/usr/lib/sysusers.d/crowdsec.conf"

  # completions
  install -Dm644 <(./cmd/crowdsec-cli/cscli completion bash) $pkgdir/usr/share/bash-completion/completion/cscli
  install -Dm644 <(./cmd/crowdsec-cli/cscli completion zsh) $pkgdir/usr/share/zsh/site-functions/_cscli
  install -Dm644 <(./cmd/crowdsec-cli/cscli completion fish) $pkgdir/usr/share/fish/vendor_completions.d/cscli.fish
}
