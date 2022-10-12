# Maintainer: Douglas Chimento <dchimento@gmail.com>
pkgname=iot-exporter
_name=iot_exporter
pkgver=r7.80f2fc7
pkgrel=2
pkgdesc="MQTT metric exporter for Prometheus Monitoring"
url='https://github.com/markuslindenberg/iot_exporter'
makedepends=('go')
license=('MIT')
arch=('any')
source=("git+https://github.com/markuslindenberg/iot_exporter.git" "$pkgname.env" "$pkgname.service" "$pkgname.sysusers" "$pkgname.tmpfiles" "mqtt.yml")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_name}"
  install -Dm755 $pkgname "${pkgdir}/usr/bin/$pkgname"
  
  cd "$srcdir"
  install -Dm640 ${pkgname}.env "${pkgdir}/etc/default/${pkgname}"
  install -Dm644 mqtt.yml "${pkgdir}/etc/${pkgname}/mqtt.yml"

  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

build() {
  cd "$srcdir/${_name}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath"
  go build -o $pkgname .
}
