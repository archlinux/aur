# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=prometheus-smartctl-exporter
_pkgname=smartctl_exporter
pkgver=0.7.0.r0.g920c342
pkgrel=1
pkgdesc="Prometheus exporter for S.M.A.R.T. metrics using smartctl"
arch=(x86_64)
url="https://github.com/prometheus-community/smartctl_exporter"
license=(LGPL3)
depends=(smartmontools)
makedepends=(go git)
backup=("etc/smartctl_exporter.yaml")
source=("git+$url.git"
        "$pkgname.service"
        "$_pkgname.yaml"
        "${_pkgname}_skip_vendor_specific_stats.patch::https://github.com/lahwaacz/smartctl_exporter/commit/b11e0feaffc5b6d34a63963bfac05446b50e7bb7.patch")
b2sums=('SKIP'
        'd0214233e4adf012707422cf24b5ffb06d0481589106245f28492bc27ebf5f667fb3cc8083f6095fb9df1a4cdf0c62dba756c464090e215b6ae37736f188f26f'
        '1499843adb3fe133b7c0945b485276ba88a2ee974dd7c4f128522eab32e4508f5880eeaf9b0b874a202dfa56738a0390039530c219d397e060c84180a939ce6a'
        '69d8c6a2fc62315c76a175693d34feaf9f835f0cc4489b43365606421c4e4daa4c8888b3f634b8794f149bd9e31128fc933623a34549af281bbe4214c581c63c')

pkgver() {
  cd "$_pkgname"
  # cut off the 'v' prefix from git tags
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  go mod vendor
  mkdir -p build

  # patch for https://github.com/prometheus-community/smartctl_exporter/pull/28
  patch -Np1 < "../${_pkgname}_skip_vendor_specific_stats.patch"
}

build() {
  cd "$_pkgname"
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

  # default config
  install -Dm644 "$_pkgname.yaml" "$pkgdir/etc/$_pkgname.yaml"

  cd "$_pkgname"

  # binary
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$_pkgname/LICENSE"
}
