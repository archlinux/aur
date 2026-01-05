# Maintainer: darko5r <darko83@pm.me>

pkgname=kwin-focus-helper
pkgver=0.1.2
pkgrel=1
pkgdesc="KWin script + CLI to allow per-app focus raising without lowering global focus stealing prevention"
arch=('x86_64' 'aarch64')
url="https://github.com/darko5r/kwin-focus-helper"
license=('MIT')

depends=('kwin')
makedepends=('rust' 'cargo' 'make')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/darko5r/kwin-focus-helper/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7e655052d4b501652704e8a5165e43a8e3b60b80b984e8890530a17694f323d6')

install="${pkgname}.install"

build() {
  cd "${srcdir}/kwin-focus-helper-${pkgver}"

  # Ensure we use the system cargo/rustc (not rustup shim), even if run as root.
  export PATH="/usr/bin:${PATH}"

  # Keep cargo artifacts out of the source tree.
  export CARGO_TARGET_DIR="${srcdir}/cargo-target"

  # Makepkg debuginfo: help ensure Rust emits usable debug info.
  export RUSTFLAGS="-C debuginfo=2"
  export CARGO_PROFILE_RELEASE_DEBUG=true

  make build
}

package() {
  cd "${srcdir}/kwin-focus-helper-${pkgver}"

  export PATH="/usr/bin:${PATH}"
  export CARGO_TARGET_DIR="${srcdir}/cargo-target"

  make install DESTDIR="${pkgdir}" prefix=/usr

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
