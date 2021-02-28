# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=prometheus-xmpp-webhook
pkgver=0.4.0
pkgrel=3
pkgdesc='XMPP-Webhook built for Prometheus/Grafana Alerts'
arch=('x86_64')
url='https://github.com/opthomas-prime/xmpp-webhook'
license=('mit')
makedepends=('go')
depends=('glibc')
optdepends=('grafana: use the webhook with Grafana alerts'
            'alertmanager: use the webhook with Prometheus'
            'prometheus: use the webhook with Prometheus')
backup=('etc/xmpp-webhook.env')
install=prometheus-xmpp-webhook.install
source=('prometheus-xmpp-webhook-sysusers.conf'
        'prometheus-xmpp-webhook.install'
        'xmpp-webhook.env'
        'xmpp-webhook.service'
        "${pkgname}-${pkgver}.tar.gz::https://github.com/opthomas-prime/xmpp-webhook/archive/v${pkgver}.tar.gz")
sha256sums=('691af96667e6eb627512f038c5f2f7b3928edc586f27aecad37f3957437a3f6a'
            '0ec7e2fb1d5d843174718b922a8bb931098c0c5a7154cf5f50aa43af24717860'
            'cb25a498d9beb927ab630db346651a7427fea128f0cc8194dd6f31b631f5abaf'
            '93988b8370da08caad5c941323a2ceec50aede3c790a20327fc26cd3d2b740a6'
            '5820e933ebcfdbee1ef87008db003ca81de71d777daf0f99fba52e9ffe3839b5')

build() {
  cd "xmpp-webhook-${pkgver}/"
  GOCACHE="${srcdir}/cache" go build -v -a \
    -trimpath \
    -ldflags "-extldflags ${LDFLAGS}" \
    -buildmode=pie \
    .
}

package() {
  install -dm775 "${pkgdir}"/usr/share/licenses/prometheus-xmpp-webhook
  install -Dm644 xmpp-webhook-${pkgver}/THIRD-PARTY-NOTICES -t "${pkgdir}"/usr/share/licenses/prometheus-xmpp-webhook
  install -Dm644 xmpp-webhook.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm755 xmpp-webhook-${pkgver}/xmpp-webhook "${pkgdir}"/usr/bin/xmpp-webhook
  install -Dm644 prometheus-xmpp-webhook-sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/prometheus-xmpp-webhook.conf

  # -o xmppwebhook -g xmppwebhook
  install -Dm644 xmpp-webhook.env -t "${pkgdir}"/etc/
}

# vim: ts=2 sw=2 et:
