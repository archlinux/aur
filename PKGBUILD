# Maintainer: plasmaDestroyer <satyasheel2004@gmail.com>
pkgname=paclens
pkgver=0.4.0
pkgrel=1
pkgdesc="A TUI-first pacman + AUR + Flatpak inspection and update tool for Arch Linux"
arch=('x86_64')
url="https://github.com/plasmaDestroyer/paclens"
license=('MIT')
# pacman-contrib is not optional: checkupdates is what makes update counts
# accurate rather than a reading of a possibly-stale local sync db, and
# paccache is what makes the reclaimable cache figure honest. Both are
# promises paclens makes about its numbers (design §3), so the tool should
# not ship in a state where it cannot keep them.
depends=('gcc-libs' 'glibc' 'pacman' 'pacman-contrib')
makedepends=('cargo' 'git')
# An AUR helper is genuinely a choice, so none of these is required and none
# is privileged at install time — paclens detects whichever is present.
optdepends=(
  'flatpak: Flatpak app and runtime scanning'
  'paru: AUR update detection and updates (preferred)'
  'yay: AUR update detection and updates'
  'pikaur: AUR update detection and updates'
)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # overlap_map.toml is compiled in via include_str!() — no runtime file.
  cargo build --frozen --release
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 config.default.toml "$pkgdir/usr/share/doc/$pkgname/config.default.toml"
}
