# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>

pkgname=prometheus-smartctl-exporter
_pkgname=smartctl_exporter
pkgver=0.8.0
pkgrel=1
pkgdesc="Prometheus exporter for S.M.A.R.T. metrics using smartctl"
arch=(x86_64)
url="https://github.com/prometheus-community/smartctl_exporter"
license=(LGPL3)
depends=(smartmontools)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.conf"
        "$pkgname.service"
        "${_pkgname}_skip_vendor_specific_stats.patch::https://github.com/lahwaacz/smartctl_exporter/commit/b11e0feaffc5b6d34a63963bfac05446b50e7bb7.patch")
b2sums=('3103ee023082d85a22a62607d9c60e6b1643ec3a3761dc7c6350d6508357ecf3b480d6512de5f816f81c06e62b580f079713d08bc956e21f18d04f942bed1eac'
        '8f90333769207a931453ef129c1cb91bfd5351d43df64826bc2fafe07b149028b156eb74ac5dfe4e5d990f39605b94e93d1b2598d4eca85ead06b0db5555c50c'
        '124b6b6273e99e7e72d8a3a569ffe46efe07e0fa70fa5f6a3135f3b2ad6f49c9737e2d491a29adac292f95e8524b8f11cb2e4aad617ff0c26b4f50c819d767ac'
        '69d8c6a2fc62315c76a175693d34feaf9f835f0cc4489b43365606421c4e4daa4c8888b3f634b8794f149bd9e31128fc933623a34549af281bbe4214c581c63c')

prepare() {
  cd "$_pkgname-$pkgver"
  go mod vendor
  mkdir -p build

  # patch for https://github.com/prometheus-community/smartctl_exporter/pull/28
  patch -Np1 < "../${_pkgname}_skip_vendor_specific_stats.patch"
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

  cd "$_pkgname-$pkgver"

  # binary
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
