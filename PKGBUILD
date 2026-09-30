# Maintainer: amad3v
# Local build from a checkout:  RECOIL16CTL_GIT=file://$PWD makepkg -si

pkgname=recoil16ctl-git
_srcname=recoil16ctl
pkgver=1.4.0.r1.g5a401b1
pkgrel=1
pkgdesc="Control tool for the PCSpecialist Recoil 16 AMD (TUXEDO Stellaris 16 Gen7): charge modes, battery health, lightbar, power profiles, Fn/Super lock, screen rotation, NVIDIA GPU power and offload, battery draw"
arch=('x86_64')
url="https://github.com/amad3v/recoil16ctl"
license=('GPL-2.0-only')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo')
optdepends=('recoil16-dkms: the drivers recoil16ctl controls'
  'libkscreen: kscreen-doctor for recoil16ctl screen and the panel line of power (KDE Plasma)'
  'mesa-utils: eglinfo for recoil16ctl gpu test'
  'vulkan-tools: vulkaninfo for recoil16ctl gpu test')
provides=('recoil16ctl')
conflicts=('recoil16ctl')
install=recoil16ctl.install
# recoil16ctl is built stripped (Cargo.toml profile), so a -debug package would be empty
options=('!debug')
source=("$_srcname::git+${RECOIL16CTL_GIT:-https://github.com/amad3v/recoil16ctl.git}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname" || return
  # release tags (v1.0.0) give 1.0.0.r<commits since tag>.g<hash>
  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '%s.r%s.g%s' "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml)" \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$_srcname" || return
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_srcname" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_srcname" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$_srcname" || return
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
