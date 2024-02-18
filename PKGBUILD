# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Michael Asher < michael at we solve everything dot com>
# Contributers: Stephen304

pkgname=crowdsec
pkgver=1.6.0
pkgrel=1
pkgdesc="The open-source and collaborative security suite"
arch=('x86_64')
url="https://www.crowdsec.net"
license=('MIT')
depends=('bash' 'gcc-libs' 'glibc' 're2')
makedepends=('go')
install=crowdsec.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crowdsecurity/crowdsec/archive/refs/tags/v${pkgver}.tar.gz"
        'crowdsec.install')
sha256sums=('6d79d67383c7faed6c5b2019e4f01c6ed84334c8c45cd1736ff18a03167aa192'
            '7075e4f867c984aff1703e6cbfd73e3c25d60a303e155b8b9458b5506944d307')

build(){
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    make BUILD_VERSION="v${pkgver}" release

    sed -i 's|/usr/local/bin|/usr/bin|' "${pkgname}-v${pkgver}/config/crowdsec.service"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

    cd "${pkgname}-v${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" cmd/crowdsec/crowdsec cmd/crowdsec-cli/cscli
    install -Dm755 -t "${pkgdir}/usr/share/${pkgname}" wizard.sh
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" config/crowdsec.service
    install -Dm644 -t "${pkgdir}/etc/${pkgname}" config/{acquis,config,console,profiles,simulation}.yaml
    install -Dm600 -t "${pkgdir}/etc/${pkgname}" config/{local_api_credentials,online_api_credentials}.yaml
    install -Dm644 -t "${pkgdir}/etc/${pkgname}/console" config/context.yaml
    install -Dm644 -t "${pkgdir}/etc/${pkgname}/patterns" config/patterns/*

    install -Dm751 -t "${pkgdir}/usr/lib/${pkgname}/plugins" cmd/notification-email/notification-email
    install -Dm751 -t "${pkgdir}/usr/lib/${pkgname}/plugins" cmd/notification-http/notification-http
    install -Dm751 -t "${pkgdir}/usr/lib/${pkgname}/plugins" cmd/notification-sentinel/notification-sentinel
    install -Dm751 -t "${pkgdir}/usr/lib/${pkgname}/plugins" cmd/notification-slack/notification-slack
    install -Dm751 -t "${pkgdir}/usr/lib/${pkgname}/plugins" cmd/notification-splunk/notification-splunk

    install -Dm644 -t "${pkgdir}/etc/${pkgname}/notitications" cmd/notification-email/email.yaml
    install -Dm644 -t "${pkgdir}/etc/${pkgname}/notitications" cmd/notification-http/http.yaml
    install -Dm644 -t "${pkgdir}/etc/${pkgname}/notitications" cmd/notification-sentinel/sentinel.yaml
    install -Dm644 -t "${pkgdir}/etc/${pkgname}/notitications" cmd/notification-slack/slack.yaml
    install -Dm644 -t "${pkgdir}/etc/${pkgname}/notitications" cmd/notification-splunk/splunk.yaml

    install -dm755 "${pkgdir}/var/lib/${pkgname}/data" "${pkgdir}/etc/${pkgname}/hub/"
}
