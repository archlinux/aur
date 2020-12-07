# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgbase="scrutiny"
pkgname=("scrutiny" "scrutiny-collector")
pkgver=0.3.5
pkgrel=5
pkgdesc="Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds"
url="https://github.com/AnalogJ/scrutiny"
license=("MIT")
arch=("x86_64")
depends=("glibc")
makedepends=("go")
source=(
    "https://github.com/AnalogJ/scrutiny/archive/${pkgver}.tar.gz"
    "scrutiny.yaml"
    "scrutiny.service"
    "scrutiny.sysusers"
    "scrutiny.tmpfiles"
    "scrutiny-collector-metrics.service"
    "scrutiny-collector-metrics.timer"
)
sha512sums=(
    "815842576ca2126c9c53ece283a9c9c30eba14a0d3727331b1634bcdebaeb2a086a9bfe8a68ec2f8c82549bb673a147b4760118437b982489d4a63ee73fdd29c"
    "0a0c3765241e2beacbb2a3a3a4545dd4db465917897038e4e7a941c7d6bfe25439dffcb2fd6c4e11f185cf550eb9748091d9805463bf8ceb07971b275722088a"
    "b82b91733e01cd9384c460aa3b3519f9c99c3f854198fe8f80968c0b607bd272a71ecc4841b2538f0ad13ef0594d5c4cbceb147e116ea141ad360fc4d1b6ef02"
    "b98bedd6ec3d56d052bd2cb8c410f17da9a8254b64e3a759e45b3ea0d2a95ff65763274b489d93faba77f88420e362189b71bd970acf90061cb8c28a0f063fe1"
    "55e620185fcb0bf8544ad70fd400b0c597cd657f67eb6a83cb4a1d414524c9996cc4efc9118628a851a86b3f909ed5ce2ae7d8fda04242cf2d00ce4995b375e9"
    "4bf9ec4248140f745e5c645cb2c814eab7d5e820bde52662e4f87d30e2622b0b088a2cb5e73110cb0f099e5d9208d5f102d2f55273d1e98d1ac7b336e014a936"
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
    backup=("etc/scrutiny-collector-metrics/scrutiny-collector-metrics.yaml")

    cd "scrutiny-${pkgver}"

    install -Dm755 scrutiny-collector-selftest "${pkgdir}/usr/bin/scrutiny-collector-selftest"
    install -Dm755 scrutiny-collector-metrics "${pkgdir}/usr/bin/scrutiny-collector-metrics"
    install -dm750 "${pkgdir}/etc/scrutiny-collector-metrics"
    install -Dm640 example.collector.yaml "${pkgdir}/etc/scrutiny-collector-metrics/scrutiny-collector-metrics.yaml"

    install -Dm644 "${srcdir}/scrutiny-collector-metrics.service" "${pkgdir}/usr/lib/systemd/system/scrutiny-collector-metrics.service"
    install -Dm644 "${srcdir}/scrutiny-collector-metrics.timer" "${pkgdir}/usr/lib/systemd/system/scrutiny-collector-metrics.timer"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/scrutiny-collector/LICENSE"
    install -Dm644 example.collector.yaml "${pkgdir}/usr/share/doc/scrutiny-collector/config.example.yaml"
}

package_scrutiny() {
    depends+=("scrutiny-web-frontend")
    backup=("etc/scrutiny/scrutiny.yaml")

    cd "scrutiny-${pkgver}"

    install -Dm755 scrutiny "${pkgdir}/usr/bin/scrutiny"
    install -dm750 "${pkgdir}/etc/scrutiny"
    install -Dm640 "${srcdir}/scrutiny.yaml" "${pkgdir}/etc/scrutiny/scrutiny.yaml"

    install -Dm644 "${srcdir}/scrutiny.service" "${pkgdir}/usr/lib/systemd/system/scrutiny.service"
    install -Dm644 "${srcdir}/scrutiny.sysusers" "${pkgdir}/usr/lib/sysusers.d/scrutiny.conf"
    install -Dm644 "${srcdir}/scrutiny.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/scrutiny.conf"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/scrutiny/LICENSE"
    install -Dm644 example.scrutiny.yaml "${pkgdir}/usr/share/doc/scrutiny/config.example.yaml"
}
