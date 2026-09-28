# Maintainer: bobo <https://aur.archlinux.org/account/bobosingle>

pkgname=manis-pocket-wayland-git
pkgver=0.1.0.r1133.gb75c51f
pkgrel=1
pkgdesc='Wayland clipboard sync client for Manis Pocket'
arch=('x86_64')
url='https://github.com/kaigedong/Manis-Pocket'
license=('MIT')
# wl-copy and wl-paste are executed at runtime, so namcap cannot detect this dependency.
depends=('glibc' 'libgcc' 'wl-clipboard')
makedepends=('cargo' 'git' 'rust')
options=('!lto')
provides=('manis-pocket-wayland')
conflicts=('manis-pocket-wayland')
source=('Manis-Pocket::git+https://github.com/kaigedong/Manis-Pocket.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Manis-Pocket"
  local _base_version
  _base_version="$(awk -F '"' '/^version = / { print $2; exit }' crates/manis-pocket-wayland/Cargo.toml)"
  printf '%s.r%s.g%s' "$_base_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/Manis-Pocket"
  CARGO_TARGET_DIR="$srcdir/target" cargo build --release --locked -p manis-pocket-wayland
}

check() {
  cd "$srcdir/Manis-Pocket"
  CARGO_TARGET_DIR="$srcdir/target" cargo test --release --locked -p manis-pocket-sync --lib register::tests
}

package() {
  install -Dm755 "$srcdir/target/release/manis-pocket-wayland" \
    "$pkgdir/usr/bin/manis-pocket-wayland"
  install -Dm644 "$srcdir/Manis-Pocket/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
