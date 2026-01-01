# Maintainer: Joshua Arnott <josh@snorfalorpagus.net>

pkgname=prometheus-chrony-exporter
pkgver=0.12.2
pkgrel=1
pkgdesc="Prometheus exporter for Chrony"
url="https://github.com/SuperQ/chrony_exporter"
arch=("x86_64")
license=("Apache-2.0")
depends=("glibc")
makedepends=("go" "git")
options=(!lto)
source=(
    "git+https://github.com/SuperQ/chrony_exporter.git#tag=v${pkgver}?signed"
    "prometheus-chrony-exporter.conf"
    "prometheus-chrony-exporter.service"
    "prometheus-chrony-exporter.sysusers"
)
sha256sums=('e997f8fe308791889fae9966cee8d61f9ec536f1c43f0e12619e518dd8f69fcb'
            'd1c43502cb42810f388efdea93296ee8f426062659b0f16daeb6f77dfc99433b'
            '737789d7b34c0665c47896c183f5e6cb72afd07d83c06b73b7e7652cb42a7bfc'
            'afa34329ae6433161ffd25075a1b23529458bc4d51d2483baff6c079a41ab9e3')
validpgpkeys=(A058935287E75D832E814E46C646B23C9E3245F1)  # https://github.com/SuperQ.gpg

build() {
    cd "chrony_exporter"
    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" \
        -X github.com/prometheus/common/version.Version=${pkgver} \
        -X github.com/prometheus/common/version.Revision=${pkgver} \
        -X github.com/prometheus/common/version.Branch=tarball \
        -X github.com/prometheus/common/version.BuildUser=someone@builder \
        -X github.com/prometheus/common/version.BuildDate=$(date -u '+%Y%m%d-%H:%M:%S' --date=@${SOURCE_DATE_EPOCH})" \
      .
}

package() {
    # systemd integration
    install -Dm 644 prometheus-chrony-exporter.conf "$pkgdir"/etc/conf.d/prometheus-chrony-exporter
    install -Dm 644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm 644 prometheus-chrony-exporter.sysusers "$pkgdir"/usr/lib/sysusers.d/prometheus-chrony-exporter.conf

    cd "chrony_exporter"
    # binary
    install -Dm 755 chrony_exporter "${pkgdir}/usr/bin/chrony_exporter"
    # license
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
