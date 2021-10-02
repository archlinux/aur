# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=prometheus-smartctl-exporter
_pkgname=smartctl_exporter
pkgver=0.6.r17.ge27581d
pkgrel=1
pkgdesc="Prometheus exporter for S.M.A.R.T. metrics using smartctl"
arch=(x86_64)
url="https://github.com/Sheridan/smartctl_exporter"
license=(LGPL3)
depends=(smartmontools)
makedepends=(go git)
backup=("etc/smartctl_exporter.yaml")
source=("git+$url.git"
        "${_pkgname}_return_cached_value.patch::https://github.com/antifuchs/smartctl_exporter/commit/f2129f945a0e484890030b1fed765fb9381b5f03.patch"
        "$pkgname.service")
b2sums=('SKIP'
        '7d38507204f94496cdd8c114ce8af24dffa20a835a12dc3d910ab23dcc986dc895a63276a7ed8f467391e4b7490a1b3ebc9df44d804f61a034b95ab63cb43431'
        '3a3a904ecb0d03904f5327a43abfa4d4078178e7477960ad7a4fd699e77006cd705503e22492d21a7cec570b9fccfaebf4ba2028467f1d1396982740c75c644d')

pkgver() {
  cd "$_pkgname"
  # cut off the stupid 'smartctl_exporter_' prefix from git tags
  git describe --long --tags | sed 's/^smartctl_exporter_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  go mod vendor
  mkdir -p build

  # patch for https://github.com/Sheridan/smartctl_exporter/pull/18
  patch -Np1 < "../${_pkgname}_return_cached_value.patch"
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

  cd "$_pkgname"

  # binary
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$pkgname"

  # default config
  install -Dm755 "$_pkgname.yaml" "$pkgdir/etc/$_pkgname.yaml"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$_pkgname/LICENSE"
}
