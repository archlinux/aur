# shellcheck disable=SC2034,SC2154
# Maintainer: Nogweii <packages@nogweii.net>
# Original maintainer: Matthew Gamble <git@matthewgamble.net>

pkgbase="scrutiny"
pkgname=("scrutiny" "scrutiny-collector")
pkgver=0.8.1
pkgrel=2
pkgdesc="Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds"
url="https://github.com/AnalogJ/scrutiny"
license=("MIT")
arch=("x86_64")
depends=("glibc")
makedepends=("go")
source=(
    "https://github.com/AnalogJ/scrutiny/archive/refs/tags/v${pkgver}.tar.gz"
    "scrutiny.service"
    "scrutiny.sysusers"
    "scrutiny.tmpfiles"
    "scrutiny-collector-metrics.service"
    "scrutiny-collector-metrics.timer"
    "scrutiny-collector-metrics.env"
)
sha512sums=('fe4f9f7ff71b50cbf913d25beb34e3599d7d189275b139314ced980fc152f2abc27dc76659fb4610cbee8960a567ff3fb797675aee20c449fab1d3eb2fd73341'
    'b82b91733e01cd9384c460aa3b3519f9c99c3f854198fe8f80968c0b607bd272a71ecc4841b2538f0ad13ef0594d5c4cbceb147e116ea141ad360fc4d1b6ef02'
    'b98bedd6ec3d56d052bd2cb8c410f17da9a8254b64e3a759e45b3ea0d2a95ff65763274b489d93faba77f88420e362189b71bd970acf90061cb8c28a0f063fe1'
    '55e620185fcb0bf8544ad70fd400b0c597cd657f67eb6a83cb4a1d414524c9996cc4efc9118628a851a86b3f909ed5ce2ae7d8fda04242cf2d00ce4995b375e9'
    'd3ec0ab99298663163409333fbf67c9fa8c03d43d4a37d1339ab942315bdf2b02d0fed5b89b02cbab4cb2ad2af1c426136f068d52e30133ee359708c87798017'
    '2108d3d619e3e6188162beb05648d436a73a3c63e526222f6037a701e8368c45395b60e2668fe8625b713d2a6a30812013c14dcb3c5de321f4d2bc153f01c5cc'
    '8c76f64bba51b5e357982508ef54b59178ddbb1ec491f9fc8256e224ed044033aaec92f2b5e6a8d9ff37137ea422a1995ece6ddae4a46df5255938865ac48152')

build() {
    cd "scrutiny-${pkgver}" || exit

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    make binary-clean binary-all WEB_BINARY_NAME=scrutiny
}

package_scrutiny-collector() {
    depends+=("smartmontools")
    backup=(
        "etc/conf.d/scrutiny-collector-metrics"
        "etc/scrutiny-collector-metrics/scrutiny-collector-metrics.yaml"
    )

    cd "scrutiny-${pkgver}" || exit

    install -Dm755 scrutiny-collector-metrics "${pkgdir}/usr/bin/scrutiny-collector-metrics"
    install -Dm644 "${srcdir}/scrutiny-collector-metrics.env" "${pkgdir}/etc/conf.d/scrutiny-collector-metrics"
    install -dm755 "${pkgdir}/etc/scrutiny-collector-metrics"
    install -Dm644 example.collector.yaml "${pkgdir}/etc/scrutiny-collector-metrics/scrutiny-collector-metrics.yaml"

    install -Dm644 "${srcdir}/scrutiny-collector-metrics.service" "${pkgdir}/usr/lib/systemd/system/scrutiny-collector-metrics.service"
    install -Dm644 "${srcdir}/scrutiny-collector-metrics.timer" "${pkgdir}/usr/lib/systemd/system/scrutiny-collector-metrics.timer"
}

package_scrutiny() {
    depends+=("scrutiny-web-frontend=${pkgver}")
    backup=("etc/scrutiny/scrutiny.yaml")

    cd "scrutiny-${pkgver}" || exit

    install -Dm755 scrutiny "${pkgdir}/usr/bin/scrutiny"
    install -dm750 "${pkgdir}/etc/scrutiny"
    # Edit the paths in the example config file to match FHS/Arch standards
    sed -si 's@location: /opt/scrutiny/.*$@location: /var/lib/scrutiny/scrutiny.db@' example.scrutiny.yaml
    sed -si 's@path: /opt/scrutiny/web$@path: /usr/share/scrutiny-web-frontend@' example.scrutiny.yaml
    install -Dm640 example.scrutiny.yaml "${pkgdir}/etc/scrutiny/scrutiny.yaml"

    install -Dm644 "${srcdir}/scrutiny.service" "${pkgdir}/usr/lib/systemd/system/scrutiny.service"
    install -Dm644 "${srcdir}/scrutiny.sysusers" "${pkgdir}/usr/lib/sysusers.d/scrutiny.conf"
    install -Dm644 "${srcdir}/scrutiny.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/scrutiny.conf"
}
