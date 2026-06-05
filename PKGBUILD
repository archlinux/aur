# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=teleport-client
pkgver=18.8.3
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure - Client-only (tsh, tctl)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('AGPL-3.0-only')
depends=('glibc' 'libfido2')
makedepends=('go>=1.16.0', 'git' 'cargo')
provides=('teleport-client' 'tctl' 'tsh')
conflicts=('teleport' 'teleport-client-bin' 'tctl' 'tsh')
source=("${pkgname%-*}-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6668a17367f750dc0a185277eaaa5f7cc8ff7c08f39d83a992eaf0b2b90a44c5')

prepare() {
  cd "${pkgname%-*}-${pkgver}"
  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  go mod download -modcacherw
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
