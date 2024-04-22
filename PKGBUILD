# Maintainer: devome <evinedeng@hotmail.com>

pkgname="ddns-go"
pkgver=6.3.3
pkgrel=1
pkgdesc="A simple, easy-to-use ddns service"
license=('MIT')
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/jeessy2/${pkgname}"
provides=("${pkgname}")
conflicts=("${pkgname}")
backup=("etc/${pkgname}/${pkgname}.env" "etc/${pkgname}/config.yml")
install="${pkgname}.install"
license=("MIT")
makedepends=("git" "go")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "${pkgname}.env"
        "${pkgname}.service"
        "${pkgname}.user.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('f3ff7c5bf45c63ba83a0129fe258d3943a6cf3efb962e101dd146bfa5a9afbec'
            'adc5116f5b965e642a826dd2ac5680a112b85b89963658dae18242cffb9224dc'
            'f1d7ee4f2ef6c13270ff7e3b9f17a35c5faba76e7601a81cc0ac75da9e27f724'
            '9f7130bfaf2e1cd48803ca1fe18708c425e2336ad7d90051d121ca1948d6e6f1'
            '558a170cae11f423591c5487dfe5f5e72f4aa88aaf62055f79a6656b6a98235a'
            '8bab4963a08132432add4a64f6148d4f0f808208087081c3ad851694a8360ad6')

build() {
    cd "${pkgname}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    local build_time="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
    local ldflags=" \
        -s -w \
        -X main.version=${pkgver} \
        -X main.buildTime=${build_time} \
        -extldflags '${LDFLAGS}'
    "
    go build \
        -trimpath \
        -ldflags="$ldflags"
}

package() {
    install -Dm755 "${pkgname}/${pkgname}"   "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}/LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}/README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${pkgname}.env"          "${pkgdir}/etc/${pkgname}/${pkgname}.env"
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
