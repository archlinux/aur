# Maintainer: lazytatsv <lazytatzv@users.noreply.github.com>
pkgname=udever-git
pkgver=r1.1234abc
pkgrel=1
pkgdesc="Interactive udev rule generator for Arch Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/lazytatzv/udever"
license=('MIT')
depends=('systemd-libs' 'gcc-libs')
makedepends=('git' 'cargo')
provides=('udever')
conflicts=('udever')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "udever"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "udever"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "udever"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
  cd "udever"
  
  # 1. Install Binary
  install -Dm755 "target/$CARCH-unknown-linux-gnu/release/udever" "$pkgdir/usr/bin/udever"
  
  # 2. Install License & Readme
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # 3. Generate & Install Shell Completions
  local bin="target/$CARCH-unknown-linux-gnu/release/udever"
  
  # Bash
  install -dm755 "$pkgdir/usr/share/bash-completion/completions"
  "$bin" --completion bash > "$pkgdir/usr/share/bash-completion/completions/udever"
  
  # Zsh
  install -dm755 "$pkgdir/usr/share/zsh/site-functions"
  "$bin" --completion zsh > "$pkgdir/usr/share/zsh/site-functions/_udever"
  
  # Fish
  install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"
  "$bin" --completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/udever.fish"
}
