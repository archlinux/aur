# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgbase="scrutiny"
pkgname=("scrutiny" "scrutiny-collector")
pkgver=0.3.5
pkgrel=1
pkgdesc="Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds"
url="https://github.com/AnalogJ/scrutiny"
license=("MIT")
arch=("x86_64")
depends=("glibc")
makedepends=("go")
source=("https://github.com/AnalogJ/scrutiny/archive/${pkgver}.tar.gz")
sha512sums=("815842576ca2126c9c53ece283a9c9c30eba14a0d3727331b1634bcdebaeb2a086a9bfe8a68ec2f8c82549bb673a147b4760118437b982489d4a63ee73fdd29c")

build() {
    cd "scrutiny-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go mod vendor
    go build -o scrutiny-collector-selftest collector/cmd/collector-selftest/collector-selftest.go
    go build -o scrutiny-collector-metrics collector/cmd/collector-metrics/collector-metrics.go
    go build -o scrutiny webapp/backend/cmd/scrutiny/scrutiny.go
}

package_scrutiny-collector() {
    depends+=("smartmontools")

    cd "scrutiny-${pkgver}"

    install -Dm755 scrutiny-collector-selftest "${pkgdir}/usr/bin/scrutiny-collector-selftest"
    install -Dm755 scrutiny-collector-metrics "${pkgdir}/usr/bin/scrutiny-collector-metrics"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/scrutiny-collector/LICENSE"
    install -Dm644 example.collector.yaml "${pkgdir}/usr/share/doc/scrutiny-collector/config.example.yaml"
}

package_scrutiny() {
    depends+=("scrutiny-web-frontend")

    cd "scrutiny-${pkgver}"

    install -Dm755 scrutiny "${pkgdir}/usr/bin/scrutiny"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/scrutiny/LICENSE"
    install -Dm644 example.scrutiny.yaml "${pkgdir}/usr/share/doc/scrutiny/config.example.yaml"
}
