# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Michael Asher <michael at we solve everything dot com>
# Contributor: Stephen304

pkgname=crowdsec
pkgver=1.7.4
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
sha256sums=('75c61e94e0162dcf6079f2c5079fba93fb2e1030b00ad37c4821bd8e041a7b9c')

prepare() {
    cd "${pkgname}"
    sed -i 's|/usr/local/|/usr/|' config/{crowdsec.service,config.yaml}
    sed -i 's|/libexec/|/lib/|' debian/crowdsec-hubupdate.service
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
    install -Dm755 cmd/crowdsec/crowdsec cmd/crowdsec-cli/cscli -t "${pkgdir}/usr/bin"
    install -Dm600 config/detect.yaml -t "${pkgdir}/var/lib/${pkgname}/data"
    install -Dm644 config/{acquis,console,profiles,simulation}.yaml -t "${pkgdir}/etc/${pkgname}"
    install -Dm600 config/{config,local_api_credentials,online_api_credentials}.yaml -t "${pkgdir}/etc/${pkgname}"
    install -Dm644 config/context.yaml -t "${pkgdir}/etc/${pkgname}/console"
    install -Dm644 config/patterns/* -t "${pkgdir}/etc/${pkgname}/patterns"
    install -Dm755 debian/hubupdate.sh -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 debian/crowdsec.service -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 debian/crowdsec-hubupdate.{service,timer} -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    for i in email file http sentinel slack splunk; do
        install -Dm551 "cmd/notification-${i}/notification-${i}" -t "${pkgdir}/usr/lib/${pkgname}/plugins"
        install -Dm600 "cmd/notification-${i}/${i}.yaml" -t "${pkgdir}/etc/${pkgname}/notifications"
    done

    install -d "${pkgdir}/etc/${pkgname}/"{acquis.d,hub}

    ./cmd/crowdsec-cli/cscli completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/cscli"
    ./cmd/crowdsec-cli/cscli completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/cscli.fish"
    ./cmd/crowdsec-cli/cscli completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_cscli"
}
