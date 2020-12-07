# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgbase="scrutiny"
pkgname=("scrutiny" "scrutiny-collector")
pkgver=0.3.5
pkgrel=2
pkgdesc="Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds"
url="https://github.com/AnalogJ/scrutiny"
license=("MIT")
arch=("x86_64")
depends=("glibc")
makedepends=("go")
source=(
    "https://github.com/AnalogJ/scrutiny/archive/${pkgver}.tar.gz"
    "scrutiny.service"
    "scrutiny-collector-metrics.service"
    "scrutiny-collector-metrics.timer"
)
sha512sums=(
    "815842576ca2126c9c53ece283a9c9c30eba14a0d3727331b1634bcdebaeb2a086a9bfe8a68ec2f8c82549bb673a147b4760118437b982489d4a63ee73fdd29c"
    "189b4fe46ed0e4dfab63cebe4c94cbdc24894b7cb59cded3d659f2741d33733eda36487912f2f5534eb45665b5f9916dbdb03626eb5e1eb0ed46981985ba69c7"
    "eb48dac311ecfd25b0a2e06d2168319e5616d0f18dcbb3014db8b7b3d224ce7c82f206c90f714ff8e58353990b1c7c3848f885d223357873abd70ec74df00c07"
    "2108d3d619e3e6188162beb05648d436a73a3c63e526222f6037a701e8368c45395b60e2668fe8625b713d2a6a30812013c14dcb3c5de321f4d2bc153f01c5cc"
)

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

    install -Dm644 "${srcdir}/scrutiny-collector-metrics.service" "${pkgdir}/usr/lib/systemd/system/scrutiny-collector-metrics.service"
    install -Dm644 "${srcdir}/scrutiny-collector-metrics.timer" "${pkgdir}/usr/lib/systemd/system/scrutiny-collector-metrics.timer"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/scrutiny-collector/LICENSE"
    install -Dm644 example.collector.yaml "${pkgdir}/usr/share/doc/scrutiny-collector/config.example.yaml"
}

package_scrutiny() {
    depends+=("scrutiny-web-frontend")

    cd "scrutiny-${pkgver}"

    install -Dm755 scrutiny "${pkgdir}/usr/bin/scrutiny"

    install -Dm644 "${srcdir}/scrutiny.service" "${pkgdir}/usr/lib/systemd/system/scrutiny.service"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/scrutiny/LICENSE"
    install -Dm644 example.scrutiny.yaml "${pkgdir}/usr/share/doc/scrutiny/config.example.yaml"
}
