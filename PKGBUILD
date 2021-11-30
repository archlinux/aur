# Maintainer: Ricardo Band <email@ricardo.band>

pkgbase='sensu-go'
pkgname=('sensu-go-agent' 'sensu-go-backend' 'sensu-go-cli')
pkgver=6.6.1
pkgrel=1
arch=('x86_64')
url='https://sensu.io'
license=('MIT')
groups=('sensu-go')
makedepends=('go' 'curl' 'jq')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/sensu/sensu-go/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgbase/-go/}-agent.service"
        "${pkgbase/-go/}-backend.service"
        "${pkgbase}-agent-${pkgver%.*}.yml.example::https://docs.sensu.io/sensu-go/${pkgver%.*}/files/agent.yml"
        "${pkgbase}-backend-${pkgver%.*}.yml.example::https://docs.sensu.io/sensu-go/${pkgver%.*}/files/backend.yml"
        "${pkgbase/-go/}.sysusers"
        "${pkgbase/-go/}.tmpfiles")
sha256sums=('68f6b23b8649faa0136c29a8edd01f25b1e0685b25bee0447ba9be027a1c940f'
            '2e512118a12f6e716c9279efd7d48eaa4e5e927a8a80444868808f34223e3c99'
            '57c4e7835da2d58186e8e36518dc9e0b7cee93bd018619ec2a7210bf212d0d27'
            'caa84541efca9c58a82aeb567cf2adb48fb5b4c252e41e62d41b209862169572'
            'abfa22de5794962ed39807d157806fa85c57a0db72817adbc4a482c4f74bbffa'
            'c4560bc809d59d5b4bff5a03c7c0082ae4eb903b82dee1d8d01b431a98eccbb2'
            '7e5f0c7d8eb9161d9e9f40fd8ef825cc500156d4575eb3599c2083013bd22407')

prepare() {
    _pkgtagsha="$(curl -L https://api.github.com/repos/sensu/sensu-go/git/ref/tags/v${pkgver} | jq -r '.object.sha')"
}

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    go build -ldflags "-X \"github.com/sensu/sensu-go/version.Version=${pkgver}\" -X \"github.com/sensu/sensu-go/version.BuildDate=$(date -I)\" -X \"github.com/sensu/sensu-go/version.BuildSHA='${_pkgtagsha}'\" " \
        -asmflags -trimpath \
        -o bin/sensu-agent \
        ./cmd/sensu-agent
    go build -ldflags "-X \"github.com/sensu/sensu-go/version.Version=${pkgver}\" -X \"github.com/sensu/sensu-go/version.BuildDate=$(date -I)\" -X \"github.com/sensu/sensu-go/version.BuildSHA='${_pkgtagsha}'\" " \
        -o bin/sensu-backend \
        ./cmd/sensu-backend
    go build -ldflags "-X \"github.com/sensu/sensu-go/version.Version=${pkgver}\" -X \"github.com/sensu/sensu-go/version.BuildDate=$(date -I)\" -X \"github.com/sensu/sensu-go/version.BuildSHA='${_pkgtagsha}'\" " \
        -o bin/sensuctl \
        ./cmd/sensuctl
}

package_sensu-go-agent() {
    pkgname='sensu-go-agent'
    _pkgname=${pkgname/-go-/-}
    pkgdesc="Sensu Go Agent"
    provides=("${pkgname/-go-/-}")
    conflicts=("${pkgname/-go-/-}")
    #backup=('etc/sensu/agent.yml')

    cd "${srcdir}/${pkgbase}-${pkgver}"

    install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver%.*}.yml.example" "${pkgdir}/usr/share/doc/${pkgname}/${pkgname/$pkgbase-/}.yml.example"
    install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${srcdir}/${pkgbase/-go/}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/${pkgbase/-go/}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

package_sensu-go-backend() {
    pkgname='sensu-go-backend'
    _pkgname=${pkgname/-go-/-}
    pkgdesc="Sensu Go Backend"
    provides=("${pkgname/-go-/-}")
    conflicts=("${pkgname/-go-/-}")
    #backup=('etc/sensu/backend.yml')

    cd "${srcdir}/${pkgbase}-${pkgver}"

    install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver%.*}.yml.example" "${pkgdir}/usr/share/doc/${pkgname}/${pkgname/$pkgbase-/}.yml.example"
    install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${srcdir}/${pkgbase/-go/}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/${pkgbase/-go/}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

package_sensu-go-cli() {
    pkgname='sensu-go-cli'
    _pkgname=${pkgname/-go-/-}
    pkgdesc="Sensu Go CLI"
    provides=("${pkgname/-go-/-}")
    conflicts=("${pkgname/-go-/-}")

    cd "${srcdir}/${pkgbase}-${pkgver}"

    install -Dm755 "bin/${_pkgname/-cli/ctl}" "${pkgdir}/usr/bin/${_pkgname/-cli/ctl}"
    install -Dm755 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
