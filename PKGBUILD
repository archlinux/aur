# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=teleport-client
pkgver=18.11.10
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
source=(
  "${pkgname%-*}-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  clean_lto_section.patch
)
sha256sums=('59462f339440cda54cef30e554e0e1322a05eadbff84d062d1085e4a8ed7eb6d'
            '264ab7109f42db54b6c3dbb472069902961cede06c3e832f7ed6d1de0879a3da')

prepare() {
  cd "${pkgname%-*}-${pkgver}"
  patch -p1 < ../clean_lto_section.patch
  rustup toolchain install
}

build() {
  cd "${pkgname%-*}-${pkgver}"

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
  cd "${pkgname%-*}-${pkgver}"

  install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl"
  install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh"
}

# vim: sw=2 ts=2 et:
