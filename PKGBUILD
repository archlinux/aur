# Maintainer: Valentin Baron <30471676+valentin-baron@users.noreply.github.com>
pkgname=m913ctl
pkgver=0.0.1
pkgrel=1
pkgdesc="Configure the Redragon M913 (Impact Elite) mouse: buttons, macros, DPI, lighting, polling rate"
arch=('x86_64')
url="https://github.com/valentin-baron/m913ctl"
license=('MIT')
depends=('glibc' 'libgcc' 'systemd-libs')
makedepends=('cargo')
# makepkg's -flto turns hidapi's C code into GCC LTO objects the Rust linker can't read;
# the binary is stripped by Cargo already, so a debug package would be empty
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33bc2aadd5e1f6d2fca56dcbd1928551ba7dc4bf5a09d7b9773bdbd0904b4e8a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release
  for sh in bash fish zsh; do
    target/release/m913ctl completions $sh > completions.$sh
  done
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/m913ctl -t "$pkgdir/usr/bin/"
  install -Dm644 70-m913.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 completions.bash "$pkgdir/usr/share/bash-completion/completions/m913ctl"
  install -Dm644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/m913ctl.fish"
  install -Dm644 completions.zsh "$pkgdir/usr/share/zsh/site-functions/_m913ctl"
  install -Dm644 README.md CONFIG.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 m913ctl.schema.yaml m913ctl.schema.json -t "$pkgdir/usr/share/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}