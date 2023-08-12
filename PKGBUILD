# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>

pkgname=prometheus-smartctl-exporter
_pkgname=smartctl_exporter
pkgver=0.10.0
pkgrel=1
pkgdesc="Prometheus exporter for S.M.A.R.T. metrics using smartctl"
arch=(x86_64)
url="https://github.com/prometheus-community/smartctl_exporter"
license=(LGPL3)
depends=(smartmontools)
makedepends=(go)
backup=("etc/conf.d/$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.conf"
        "$pkgname.service")
b2sums=('f4367fb6805b70d1c02013b17593729cda9d62f2cfe39a7bd9b209c336a41c8902f06c5a819b2a523f62ac325a5e8d7f94f754fbe3f768d7c3bc3f42263193a9'
        '8f90333769207a931453ef129c1cb91bfd5351d43df64826bc2fafe07b149028b156eb74ac5dfe4e5d990f39605b94e93d1b2598d4eca85ead06b0db5555c50c'
        '124b6b6273e99e7e72d8a3a569ffe46efe07e0fa70fa5f6a3135f3b2ad6f49c9737e2d491a29adac292f95e8524b8f11cb2e4aad617ff0c26b4f50c819d767ac')

prepare() {
  cd "$_pkgname-$pkgver"
  go mod vendor
  mkdir -p build
}

build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  # systemd service
  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$pkgname.conf" "$pkgdir/etc/conf.d/$pkgname"

  cd "$_pkgname-$pkgver"

  # binary
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
