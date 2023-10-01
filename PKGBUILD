# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: Crowdsec Team <debian@crowdsec.net>

pkgname=crowdsec-bin
pkgver=1.5.4
pkgrel=6
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
    'docker: for running the observability dashboard via docker'
)
backup=(
    etc/crowdsec/config.yaml
    etc/crowdsec/local_api_credentials.yaml
    etc/crowdsec/online_api_credentials.yaml
)
source=(
    "$pkgname-v${pkgver}.tgz"::https://github.com/crowdsecurity/crowdsec/releases/download/v${pkgver}/crowdsec-release.tgz
    crowdsec-bin.install
)
sha256sums=('489d2dbd009f1255714f7448116562c4608452a8010ee4677803c10e02a7fbbf'
            '27bd6974d92a5cb2eb3ff0739861a1cc1da4e99c71677595c1c485312fd69cf9')

prepare() {
    cd "$srcdir/crowdsec-v${pkgver}"
    sed -ie 's|plugin_dir:.*|plugin_dir: /usr/lib/crowdsec/plugins/|' config/config.yaml
    sed -ie 's|usr/local/bin/crowdsec|usr/bin/crowdsec|' config/crowdsec.service
    find ./config -type f -regex '.*_win_?.*\.yaml' -delete
}

package() {
    cd "$srcdir/crowdsec-v${pkgver}"
    # create directories
    install -dm755 $pkgdir{/usr/lib/{crowdsec/plugins,systemd/system},/etc/crowdsec{,/hub,/notifications,/console,/acquis.d,/scenarios,/postoverflows,/collections,/bouncers,/metabase},/usr/bin,/var/lib/crowdsec/data/,/opt/crowdsec/}

    # config
    install -m640 ./config/{config,console,profiles,simulation,acquis,local_api_credentials,online_api_credentials,dev,user}.yaml -t $pkgdir/etc/crowdsec/
    install -m640 ./config/context.yaml $pkgdir/etc/crowdsec/console/context.yaml
    cp -R ./config/patterns $pkgdir/etc/crowdsec/

    # systemd
    install -m640 ./config/crowdsec.service $pkgdir/usr/lib/systemd/system/crowdsec.service

    # executables
    install -m755 ./cmd/{crowdsec-cli/cscli,crowdsec/crowdsec} -t $pkgdir/usr/bin/

    # plugins
    install -m700 ./cmd/notification-dummy/notification-dummy $pkgdir/usr/lib/crowdsec/plugins/dummy
    install -m640 ./cmd/notification-dummy/dummy.yaml -t $pkgdir/etc/crowdsec/notifications
    install -m700 ./cmd/notification-email/notification-email $pkgdir/usr/lib/crowdsec/plugins/email
    install -m640 ./cmd/notification-email/email.yaml -t $pkgdir/etc/crowdsec/notifications
    install -m700 ./cmd/notification-http/notification-http $pkgdir/usr/lib/crowdsec/plugins/http
    install -m640 ./cmd/notification-http/http.yaml -t $pkgdir/etc/crowdsec/notifications
    install -m700 ./cmd/notification-slack/notification-slack $pkgdir/usr/lib/crowdsec/plugins/slack
    install -m640 ./cmd/notification-slack/slack.yaml -t $pkgdir/etc/crowdsec/notifications
    install -m700 ./cmd/notification-splunk/notification-splunk $pkgdir/usr/lib/crowdsec/plugins/splunk
    install -m640 ./cmd/notification-splunk/splunk.yaml -t $pkgdir/etc/crowdsec/notifications

    # extras
    install -m640 ./config/crowdsec.cron.daily -t $pkgdir/opt/crowdsec/
    install -m740 ./wizard.sh -t $pkgdir/opt/crowdsec/
}
