# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=prometheus-xmpp-webhook-git
pkgver=0.2_5_g8346a2202805
pkgrel=1
pkgdesc='XMPP-Webhook built for Prometheus/Grafana Alerts'
arch=('x86_64')
url='https://github.com/opthomas-prime/xmpp-webhook'
license=('mit')
depends=('glibc')
optdepends=('grafana: use the webhook with Grafana alerts'
            'alertmanager: use the webhook with Prometheus'
            'prometheus: use the webhook with Prometheus')
backup=('etc/xmpp-webhook.env')
install=prometheus-xmpp-webhook.install
conflicts=('prometheus-xmpp-webhook')
provides=('prometheus-xmpp-webhook')
source=('prometheus-xmpp-webhook-sysusers.conf'
        'prometheus-xmpp-webhook.install'
        'xmpp-webhook.env'
        'xmpp-webhook.service.patch'
        "${pkgname}::git+https://github.com/opthomas-prime/xmpp-webhook.git")
sha256sums=('691af96667e6eb627512f038c5f2f7b3928edc586f27aecad37f3957437a3f6a'
            '0ec7e2fb1d5d843174718b922a8bb931098c0c5a7154cf5f50aa43af24717860'
            'e97efa5c6d3f7f4e970a84220cd73fbc0fb8e213623c4c44652f3c57d348e2a4'
            'a2938e74de29c13ee08f5dad3fc8b2c4b618ec90a85ca8e95a4470f87f8af4f7'
            'SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags --long | sed s/-/_/g
}

prepare() {
  patch -p1 ${pkgname}/xmpp-webhook.service xmpp-webhook.service.patch
}

build() {
  cd "${pkgname}"
  go build
}

package() {
  install -dm775 "${pkgdir}"/usr/share/licenses/prometheus-xmpp-webhook
  install -Dm644 ${pkgname}/THIRD-PARTY-NOTICES -t "${pkgdir}"/usr/share/licenses/prometheus-xmpp-webhook
  install -Dm644 ${pkgname}/xmpp-webhook.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm755 ${pkgname}/xmpp-webhook "${pkgdir}"/usr/bin/xmpp-webhook
  install -Dm644 prometheus-xmpp-webhook-sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/prometheus-xmpp-webhook.conf

  # -o xmppwebhook -g xmppwebhook
  install -Dm640 xmpp-webhook.env -t "${pkgdir}"/etc/
}

# vim: ts=2 sw=2 et:
