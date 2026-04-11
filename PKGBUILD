# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=teleport-client
pkgver=18.7.2
pkgrel=2
pkgdesc="Modern SSH server for teams managing distributed infrastructure - Client-only (tsh, tctl)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('AGPL-3.0-only')
depends=('glibc' 'libfido2')
makedepends=('go>=1.16.0', 'git' 'cargo')
provides=('teleport-client' 'tctl' 'tsh')
conflicts=('teleport' 'teleport-client-bin' 'tctl' 'tsh')
source=("${pkgname%-*}-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('26822b4dbfba8daa672686c235cdff6714c75c9598fdedc8e26ebd20de1aa2ad')

prepare() {
  cd "${pkgname%-*}-${pkgver}"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download
}

build() {
  cd "${pkgname%-*}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export ADDFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  make build/tsh build/tctl

  # Clean up deps
  go clean -modcache
}

package() {
  cd "${pkgname%-*}-${pkgver}"

  install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl"
  install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh"
}

# vim: sw=2 ts=2 et:
