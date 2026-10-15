# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=teleport-client-17
pkgver=17.7.29
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure - Client-only 17.X branch (tsh, tctl)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('AGPL-3.0-only')
depends=('glibc' 'libfido2')
makedepends=(go git clang llvm)
provides=('teleport-client-17' 'tctl-17' 'tsh-17')
source=("${pkgname%-*}-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7fc99844ab18747e14f82d5bf6ee285f69cdef1487672638eef234b3f50e7e9')

build() {
  cd "${pkgname%%-*}-${pkgver}"

  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
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
  cd "${pkgname%%-*}-${pkgver}"

  install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl-17"
  install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh-17"
}

# vim: tabstop=2 shiftwidth=2 expandtab
