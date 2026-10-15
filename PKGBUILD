# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=teleport-client
pkgver=18.11.1
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure - Client-only (tsh, tctl)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=(AGPL-3.0-only)
depends=(glibc libfido2)
makedepends=(go git rustup clang llvm)
options=(!lto)
provides=(teleport-client tctl tsh)
conflicts=(teleport teleport-client-bin tctl tsh)
source=("${pkgname%-*}-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a95bddd445dc3f93d91493b48e73d39959bbc4d4d00cd93fea34b3d02c3ba1da')

prepare() {
  cd "${pkgname%-*}-${pkgver}"
  rustup toolchain install
}

build() {
  cd "${pkgname%-*}-${pkgver}"

  export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export ADDFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

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
