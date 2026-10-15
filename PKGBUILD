# Maintainer: archix contributors <https://github.com/archix-org/archix>
pkgname=archix-git
pkgver=0.1.0.r57.gc22a7df
pkgrel=1
pkgdesc="Declarative, lockable, rollback-able system configuration for Arch Linux (latest commit)"
arch=('x86_64')
url="https://archix.dev"
license=('MIT OR Apache-2.0')
depends=('pacman' 'gcc-libs' 'glibc')
makedepends=('git' 'rust' 'rust-musl' 'musl')
optdepends=(
  'git: AUR packages and recording the config commit'
  'devtools: building AUR packages in a clean chroot'
  'mkinitcpio: boot entries'
  'systemd-ukify: boot entries'
  'sbctl: signing boot entries for Secure Boot'
  'btrfs-progs: snapshots before each switch'
  'flatpak: Flatpak apps'
)
provides=('archix')
conflicts=('archix')
# ARCHIX_BRANCH=<branch> makepkg -si builds an unmerged branch instead of main.
source=("archix::git+https://github.com/archix-org/archix.git#branch=${ARCHIX_BRANCH:-main}")
sha256sums=('SKIP')
# makepkg's LTO turns the bundled C libraries (zstd, Lua) into GCC bytecode the Rust linker can't read.
options=('!lto' '!debug')

pkgver() {
  cd archix
  printf "%s.r%s.g%s" \
    "$(grep -m1 '^version' Cargo.toml | cut -d '"' -f2)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd archix
  # With rustup instead of pacman's rust, the musl target comes from rustup rather than rust-musl.
  if command -v rustup >/dev/null; then
    rustup target add x86_64-unknown-linux-musl
  fi
  cargo fetch --locked
}

build() {
  cd archix
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  # The rescue initramfs runs archix before the root filesystem's libraries are usable, so it needs a static build.
  CFLAGS= CXXFLAGS= LDFLAGS= cargo build --frozen --release --target x86_64-unknown-linux-musl
}

check() {
  cd archix
  cargo test --frozen --release --lib
}

package() {
  cd archix
  install -Dm755 target/release/archix "$pkgdir/usr/bin/archix"
  install -Dm755 target/x86_64-unknown-linux-musl/release/archix "$pkgdir/usr/lib/archix/archix-static"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}
