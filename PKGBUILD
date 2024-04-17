# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Michael Asher <michael at we solve everything dot com>
# Contributor: Stephen304

pkgname=crowdsec
pkgver=1.6.1
pkgrel=1
pkgdesc="The open-source and collaborative security suite"
arch=('aarch64' 'x86_64')
url="https://www.crowdsec.net"
license=('MIT')
depends=('bash' 'gcc-libs' 'glibc' 're2')
makedepends=('go')
backup=(etc/crowdsec/{acquis,config,console,profiles,simulation}.yaml
        etc/crowdsec/{local_api_credentials,online_api_credentials}.yaml
        etc/crowdsec/console/context.yaml
        etc/crowdsec/notifications/{email,http,sentinel,slack,splunk}.yaml)
install=crowdsec.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crowdsecurity/crowdsec/archive/refs/tags/v${pkgver}.tar.gz"
        'crowdsec.install')
sha256sums=('867ab7a0725724d3ba5e13e5808668389756a2ce996da9ffc184949c9fabfd84'
            'e2c45c4773fa28fc6528d662429c2bbe26b52df2cbc020a39e6737360f6752b5')

prepare() {
    cd "${pkgname}-${pkgver}/config"
    sed -i 's|/usr/local/bin|/usr/bin|' crowdsec.service config.yaml
}

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    make -j1 BUILD_VERSION="v${pkgver}" release
}

package() {
    cd "${pkgname}-${pkgver}/${pkgname}-v${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" cmd/crowdsec/crowdsec cmd/crowdsec-cli/cscli
    install -Dm755 -t "${pkgdir}/usr/share/${pkgname}" wizard.sh
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" config/crowdsec.service
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../LICENSE

    install -Dm644 -t "${pkgdir}/etc/${pkgname}" config/{acquis,config,console,profiles,simulation}.yaml
    install -Dm600 -t "${pkgdir}/etc/${pkgname}" config/{local_api_credentials,online_api_credentials}.yaml
    install -Dm644 -t "${pkgdir}/etc/${pkgname}/console" config/context.yaml
    install -Dm644 -t "${pkgdir}/etc/${pkgname}/patterns" config/patterns/*

    for i in email http sentinel slack splunk; do
        install -Dm751 -t "${pkgdir}/usr/lib/${pkgname}/plugins" "cmd/notification-${i}/notification-${i}"
        install -Dm644 -t "${pkgdir}/etc/${pkgname}/notifications" "cmd/notification-${i}/${i}.yaml"
    done

    install -dm755 "${pkgdir}/var/lib/${pkgname}/data" "${pkgdir}/etc/${pkgname}/hub"
}
