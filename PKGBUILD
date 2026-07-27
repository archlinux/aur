# Maintainer: SHN2004 <srhari101 at gmail dot com>

pkgname=cleanarch-tui
pkgver=0.1.0
pkgrel=1
pkgdesc='Safe, preset-driven cleanup TUI for Arch-family Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/SHN2004/cleanarch'
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
conflicts=('cleanarch')
optdepends=(
  'sudo: privileged cleanup tasks'
  'pacman-contrib: paccache and pacnew/pacsave support'
  'flatpak: Flatpak cleanup tasks'
  'docker: Docker cleanup tasks'
  'podman: Podman cleanup tasks'
  'snapd: Snap cleanup tasks'
)
source=("cleanarch-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8e4f12516c0abee8b6a2663cc1a1b75b344efd47c19804a0e0c9c470c43c3636')

prepare() {
  cd "cleanarch-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "cleanarch-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "cleanarch-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-targets
}

package() {
  cd "cleanarch-$pkgver"
  install -Dm755 "target/release/cleanarch" "$pkgdir/usr/bin/cleanarch"
  install -d "$pkgdir/usr/share/bash-completion/completions" "$pkgdir/usr/share/zsh/site-functions" "$pkgdir/usr/share/fish/vendor_completions.d"
  "target/release/cleanarch" completions bash > "$pkgdir/usr/share/bash-completion/completions/cleanarch"
  "target/release/cleanarch" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_cleanarch"
  "target/release/cleanarch" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/cleanarch.fish"
  install -Dm644 "man/cleanarch.1" "$pkgdir/usr/share/man/man1/cleanarch.1"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/cleanarch/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/cleanarch/LICENSE-APACHE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/cleanarch/README.md"
}
