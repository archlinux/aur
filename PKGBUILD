# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Michael Asher <michael at we solve everything dot com>
# Contributor: Stephen304

pkgname=crowdsec
pkgver=1.6.3
pkgrel=1
pkgdesc="The open-source and collaborative security suite"
arch=('aarch64' 'x86_64')
url="https://www.crowdsec.net"
license=('MIT')
depends=('bash' 'gcc-libs' 'glibc' 're2')
makedepends=('git' 'go')
backup=(etc/crowdsec/{acquis,config,console,profiles,simulation}.yaml
        etc/crowdsec/{local_api_credentials,online_api_credentials}.yaml
        etc/crowdsec/console/context.yaml
        etc/crowdsec/notifications/{email,file,http,sentinel,slack,splunk}.yaml)
install=crowdsec.install
source=("git+https://github.com/crowdsecurity/crowdsec.git#tag=v${pkgver}")
sha256sums=('25be7e4352e8645d756d036162c2613e9fbdac82ab8e5e35d75fb1d7bdaf7396')

prepare() {
    cd "${pkgname}/config"
    sed -i 's|/usr/local/|/usr/|' crowdsec.service config.yaml
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    make -j1 BUILD_VERSION="v${pkgver}" build
}

package() {
    cd "${pkgname}"
    install -Dm755 -t "${pkgdir}/usr/bin" cmd/crowdsec/crowdsec cmd/crowdsec-cli/cscli
    install -Dm755 -t "${pkgdir}/usr/share/${pkgname}" wizard.sh
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" config/crowdsec.service
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

    install -Dm644 -t "${pkgdir}/etc/${pkgname}" config/{acquis,config,console,profiles,simulation}.yaml
    install -Dm600 -t "${pkgdir}/etc/${pkgname}" config/{local_api_credentials,online_api_credentials}.yaml
    install -Dm644 -t "${pkgdir}/etc/${pkgname}/console" config/context.yaml
    install -Dm644 -t "${pkgdir}/etc/${pkgname}/patterns" config/patterns/*

    for i in email file http sentinel slack splunk; do
        install -Dm751 -t "${pkgdir}/usr/lib/${pkgname}/plugins" "cmd/notification-${i}/notification-${i}"
        install -Dm644 -t "${pkgdir}/etc/${pkgname}/notifications" "cmd/notification-${i}/${i}.yaml"
    done

    install -d "${pkgdir}/var/lib/${pkgname}/data" "${pkgdir}/etc/${pkgname}"/{acquis.d,hub}
}
