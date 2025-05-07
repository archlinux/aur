# Maintainer: Adam Wahab <awahab@adhoc.tools>

_name=wiremix
pkgname=${_name,,}-git
pkgver=r428.44d4c92
pkgrel=1
pkgdesc="A simple TUI audio mixer for PipeWire"
url="https://github.com/tsowell/$_name"
arch=(x86_64)
license=(Apache-2.0 MIT)
depends=(libpipewire)
makedepends=(cargo clang libpipewire pkgconf)
options=(!lto)
provides=($_name)
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/$_name" || exit 1
  set -o pipefail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "${srcdir}/$_name" || exit 1
  cargo build --frozen --release
}

package() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "${srcdir}/$_name" || exit 1
  cargo install --no-track --root "$pkgdir/usr/" --path .
  install -Dm644 LICENSE-APACHE LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
