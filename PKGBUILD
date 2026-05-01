# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=teleport-client-17
pkgver=17.7.23
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure - Client-only 17.X branch (tsh, tctl)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('AGPL-3.0-only')
depends=('glibc' 'libfido2')
makedepends=('go>=1.16.0', 'git')
provides=('teleport-client-17' 'tctl-17' 'tsh-17')
source=("${pkgname%-*}-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bba6a27d02706d121277285e705a7ef56d6cc8f134956c8b081280de92c2ca1a')

prepare() {
  cd "${pkgname%%-*}-${pkgver}"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname%%-*}-${pkgver}"

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
