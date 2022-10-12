# Maintainer: Douglas Chimento <dchimento@gmail.com>
pkgname=tasmota-prometheus-discovery
_name=tasmota-prometheus-service-discovery
pkgver=r8.d407c77
pkgrel=2
pkgdesc='Custom Tasmota Service Discover for Tasmota devices'
url='https://github.com/dougEfresh/tasmota-prometheus-service-discovery'
makedepends=(go)
backup=("etc/default/$pkgname")
license=('MIT')
arch=('any')
source=("git+https://github.com/dougEfresh/tasmota-prometheus-service-discovery.git" "$pkgname.env" "$pkgname.service" "$pkgname.sysusers" "$pkgname.tmpfiles")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_name}"
  install -Dm755 $pkgname "${pkgdir}/usr/bin/tpsd"
  
  cd "$srcdir"
  install -Dm640 ${pkgname}.env "${pkgdir}/etc/default/${pkgname}"

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
