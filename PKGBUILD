# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

pkgname=prometheus-dnsmasq-exporter-git
pkgdesc="Prometheus exporter allowing you to monitor/alert on the number of DHCP leases and various DNS statistics"
pkgver=0.2.0.r11.g6d9ae78
pkgrel=1
arch=('x86_64')
url="https://github.com/google/dnsmasq_exporter"
license=('Apache')
makedepends=(
  'git'
  'go'
)
depends=(
  'glibc'
  'prometheus'
)
source=(${pkgname}::git+https://github.com/google/dnsmasq_exporter.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"

  export GO11MODULE=on
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o dnsmasq_exporter .
}

package() {
  cd "${pkgname}"

  install -Dm 755 ./dnsmasq_exporter "${pkgdir}/usr/bin/dnsmasq_exporter"
  install -Dm 644 ./dnsmasq_exporter.service "${pkgdir}/usr/lib/systemd/system/dnsmasq_exporter.service"
}
