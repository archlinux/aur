# Maintainer: amad3v

pkgname=recoil16ctl
_srcname=recoil16ctl
pkgver=1.4.0
pkgrel=1
pkgdesc="Control tool for the PCSpecialist Recoil 16 AMD (TUXEDO Stellaris 16 Gen7): charge modes, battery health, lightbar, power profiles, Fn/Super lock, screen rotation, NVIDIA GPU power and offload, battery draw"
arch=('x86_64')
url="https://github.com/amad3v/recoil16ctl"
license=('GPL-2.0-only')
depends=('glibc' 'libgcc')
makedepends=('cargo')
optdepends=('recoil16-dkms: the drivers recoil16ctl controls'
  'libkscreen: kscreen-doctor for recoil16ctl screen and the panel line of power (KDE Plasma)'
  'mesa-utils: eglinfo for recoil16ctl gpu test'
  'vulkan-tools: vulkaninfo for recoil16ctl gpu test')
install=recoil16ctl.install
# recoil16ctl is built stripped (Cargo.toml profile), so a -debug package would be empty
options=('!debug')
source=("$_srcname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be9f6952b78b0e1048cf0471bc63986bab0dd93e0907bae70e449c3fad2a166e')

prepare() {
  cd "$_srcname-$pkgver" || return
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_srcname-$pkgver" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_srcname-$pkgver" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$_srcname-$pkgver" || return
  local ctl=target/release/recoil16ctl

  # shellcheck disable=SC2154 # pkgdir is set by makepkg for package()
  install -Dm755 "$ctl" "$pkgdir/usr/bin/recoil16ctl"
  install -d "$pkgdir/usr/share/bash-completion/completions" \
    "$pkgdir/usr/share/zsh/site-functions" \
    "$pkgdir/usr/share/fish/vendor_completions.d"
  "$ctl" completions bash >"$pkgdir/usr/share/bash-completion/completions/recoil16ctl"
  "$ctl" completions zsh >"$pkgdir/usr/share/zsh/site-functions/_recoil16ctl"
  "$ctl" completions fish >"$pkgdir/usr/share/fish/vendor_completions.d/recoil16ctl.fish"
  "$ctl" man "$pkgdir/usr/share/man/man1"

  # KDE: default global shortcut Sc -> recoil16ctl screen rotate
  install -Dm644 data/kglobalaccel/recoil16.desktop -t "$pkgdir/usr/share/kglobalaccel/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
