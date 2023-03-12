# Maintainer: Ricardo Band <email@ricardo.band>

pkgbase='sensu-go'
pkgname=('sensu-go-agent' 'sensu-go-backend' 'sensu-go-cli')
pkgdesc="Sensu is an open source monitoring tool for ephemeral infrastructure and distributed applications."
pkgver=6.9.2
pkgrel=1
arch=('x86_64')
url='https://sensu.io'
license=('custom:MIT')
groups=('sensu-go' 'sensu')
makedepends=('go' 'curl' 'jq')
depends=('glibc')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/sensu/sensu-go/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgbase/-go/}-agent.service"
        "${pkgbase/-go/}-backend.service"
        "${pkgbase}-agent-${pkgver%.*}.yml.example::https://docs.sensu.io/sensu-go/${pkgver%.*}/files/agent.yml"
        "${pkgbase}-backend-${pkgver%.*}.yml.example::https://docs.sensu.io/sensu-go/${pkgver%.*}/files/backend.yml"
        "${pkgbase/-go/}.sysusers"
        "${pkgbase/-go/}.tmpfiles")
sha256sums=('3f3ca3acdb8c50338a397e7988a53295e5f96c7f4474887300620c746057f949'
            '2e512118a12f6e716c9279efd7d48eaa4e5e927a8a80444868808f34223e3c99'
            '57c4e7835da2d58186e8e36518dc9e0b7cee93bd018619ec2a7210bf212d0d27'
            'caa84541efca9c58a82aeb567cf2adb48fb5b4c252e41e62d41b209862169572'
            'b45ccd7a2de13acd34b7f5edc560ac99940393d3d538ca8e10de0a36f80ee2dd'
            'c4560bc809d59d5b4bff5a03c7c0082ae4eb903b82dee1d8d01b431a98eccbb2'
            '7e5f0c7d8eb9161d9e9f40fd8ef825cc500156d4575eb3599c2083013bd22407')

prepare() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    _pkgtagsha="$(curl -L https://api.github.com/repos/sensu/sensu-go/git/ref/tags/v${pkgver} | jq -r '.object.sha')"
    mkdir -p build/
}

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -buildvcs=false -o build -ldflags="-linkmode=external -X='github.com/sensu/sensu-go/version.Version=${pkgver}' -X='github.com/sensu/sensu-go/version.BuildDate=$(date -I)' -X='github.com/sensu/sensu-go/version.BuildSHA=${_pkgtagsha}'" ./cmd/...
}

package_sensu-go-agent() {
    pkgname='sensu-go-agent'
    _pkgname=${pkgname/-go-/-}
    pkgdesc="Sensu Go Agent"
    provides=("${pkgname/-go-/-}")
    conflicts=("${pkgname/-go-/-}")
    #backup=('etc/sensu/agent.yml')

    cd "${srcdir}/${pkgbase}-${pkgver}"

    install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
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

    install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
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

    install -Dm755 "build/${_pkgname/-cli/ctl}" "${pkgdir}/usr/bin/${_pkgname/-cli/ctl}"
    install -Dm755 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
