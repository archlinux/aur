# Maintainer: Igor Kulkov <xp.jfk9w@gmail.com>

pkgname=prometheus-openweather-exporter
_pkgname=openweather-exporter
pkgver=0.0.13
pkgrel=1

pkgdesc='Prometheus exporter for openweather API'
url='https://github.com/billykwooten/openweather-exporter'
arch=('x86_64' 'aarch64' 'armv7h')
license=('Apache-2.0')

depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/billykwooten/openweather-exporter/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}@.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")

sha256sums=('bd8562e91c1b193c82faae2ba3e51174b4e3eaa91274e7ccbb51ce9342cf863d'
            '693fcf42868b22c5d4b1f8c5f4b9c8b685243166a52d5141855c40f21c725d39'
            '01aa82e796e3ca57467a00c6ea6ed5068e85dde1bfd2001feb8d642ad0d50300'
            'bcfaa0856bce9aefe0db0533d86287cd8fe7ebfa2a6eba1d1b67adbef1222692')

build() {
    cd "${_pkgname}-${pkgver}"
    go mod vendor
    go build \
      -o "../${pkgname}" \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      .
}

package() {
    install -Dm644 "${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
