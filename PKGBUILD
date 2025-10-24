# Maintainer: Adam Wahab <awahab@adhoc.tools>
_name=wiremix
pkgname=${_name,,}-git
pkgver=r6.879c50a
pkgrel=1
pkgdesc="A simple TUI audio mixer for PipeWire"
arch=(x86_64)
url="https://github.com/tsowell/$_name"
license=(Apache-2.0 MIT)
depends=(libpipewire)
makedepends=(cargo clang git)
options=(!lto)
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_name" || exit 1
  set -o pipefail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/$_name" || exit 1
  cargo build --locked --release
}

package() {
  cd "$srcdir/$_name" || exit 1
  install -Dm755 "target/release/$_name" -t "$pkgdir/usr/bin"
  install -Dm755 $_name.toml "$pkgdir/usr/share/$_name/$_name.toml.example"
  install -Dm644 LICENSE-APACHE LICENSE-MIT -t "$pkgdir/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname}"
  install -Dm644 $_name.desktop -t "$pkgdir/usr/share/applications"
}
