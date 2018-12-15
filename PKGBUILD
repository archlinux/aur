# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=prometheus-xmpp-webhook
pkgver=0.2
pkgrel=5
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
source=('prometheus-xmpp-webhook-sysusers.conf'
        'prometheus-xmpp-webhook.install'
        'xmpp-webhook.env'
        'xmpp-webhook.service.patch'
        "https://github.com/opthomas-prime/xmpp-webhook/archive/${pkgver}.tar.gz")
sha256sums=('691af96667e6eb627512f038c5f2f7b3928edc586f27aecad37f3957437a3f6a'
            '0ec7e2fb1d5d843174718b922a8bb931098c0c5a7154cf5f50aa43af24717860'
            'e97efa5c6d3f7f4e970a84220cd73fbc0fb8e213623c4c44652f3c57d348e2a4'
            'a2938e74de29c13ee08f5dad3fc8b2c4b618ec90a85ca8e95a4470f87f8af4f7'
            '15fac0b3f8bc81ff53c6a856c3a8fcd5cddbfd7593a18fd69af2cfad4d98298c')

prepare() {
  patch -p1 xmpp-webhook-${pkgver}/xmpp-webhook.service xmpp-webhook.service.patch
}

build() {
  cd "xmpp-webhook-${pkgver}/"
  go build
}

package() {
  install -dm775 "${pkgdir}"/usr/share/licenses/prometheus-xmpp-webhook
  install -Dm644 xmpp-webhook-${pkgver}/THIRD-PARTY-NOTICES -t "${pkgdir}"/usr/share/licenses/prometheus-xmpp-webhook
  install -Dm644 xmpp-webhook-${pkgver}/xmpp-webhook.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm755 xmpp-webhook-${pkgver}/xmpp-webhook "${pkgdir}"/usr/bin/xmpp-webhook
  install -Dm644 prometheus-xmpp-webhook-sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/prometheus-xmpp-webhook.conf

  # -o xmppwebhook -g xmppwebhook
  install -Dm640 xmpp-webhook.env -t "${pkgdir}"/etc/
}

# vim: ts=2 sw=2 et:
