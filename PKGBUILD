# Maintainer: amad3v
# Local build from a checkout:  RECOIL16_GIT=file://$PWD/../../.. makepkg -si

pkgname=recoil16-dkms-git
_srcname=recoil16
pkgver=1.1.0.r0.gee43cb4
pkgrel=1
pkgdesc="Drivers and recoil16ctl for the PCSpecialist Recoil 16 AMD (TUXEDO Stellaris 16 Gen7): keyboard backlight, lightbar, power profiles, charge modes, battery health, Copilot key"
arch=('x86_64')
url="https://github.com/amad3v/recoil16"
license=('GPL-2.0-only' 'GPL-2.0-or-later')
depends=('dkms' 'glibc' 'libgcc')
makedepends=('git' 'cargo')
optdepends=('linux-headers: build the modules for the linux kernel'
  'libkscreen: kscreen-doctor for recoil16ctl screen rotate (KDE Plasma)')
provides=('recoil16-dkms')
conflicts=('recoil16-dkms')
install=recoil16.install
# recoil16ctl is built stripped (Cargo.toml profile), so a -debug package would be empty
options=('!debug')
source=("$_srcname::git+${RECOIL16_GIT:-https://github.com/amad3v/recoil16.git}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname" || return
  # release tags (v1.0.0) give 1.0.0.r<commits since tag>.g<hash>
  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '%s.r%s.g%s' "$(sed -n 's/^PACKAGE_VERSION="\(.*\)"/\1/p' dkms.conf)" \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$_srcname/recoil16ctl" || return
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_srcname/recoil16ctl" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_srcname/recoil16ctl" || return
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$_srcname" || return
  # shellcheck disable=SC2154 # pkgdir is set by makepkg for package()
  local src="$pkgdir/usr/src/$_srcname-$pkgver"

  install -d "$src"
  cp -r --no-preserve=ownership Kbuild ite8291-mono ite8233-lightbar copilot-rctrl uniwill-laptop-pcs "$src/"
  rm -rf "$src/uniwill-laptop-pcs/patches"
  sed "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/" dkms.conf >"$src/dkms.conf"

  local ctl=recoil16ctl/target/release/recoil16ctl
  install -Dm755 "$ctl" "$pkgdir/usr/bin/recoil16ctl"
  install -d "$pkgdir/usr/share/bash-completion/completions" \
    "$pkgdir/usr/share/zsh/site-functions" \
    "$pkgdir/usr/share/fish/vendor_completions.d"
  "$ctl" completions bash >"$pkgdir/usr/share/bash-completion/completions/recoil16ctl"
  "$ctl" completions zsh >"$pkgdir/usr/share/zsh/site-functions/_recoil16ctl"
  "$ctl" completions fish >"$pkgdir/usr/share/fish/vendor_completions.d/recoil16ctl.fish"
  "$ctl" man "$pkgdir/usr/share/man/man1"
  install -Dm644 man/recoil16.7 -t "$pkgdir/usr/share/man/man7/"

  # KDE: default global shortcut Sc -> recoil16ctl screen rotate
  install -Dm644 data/kglobalaccel/recoil16.desktop -t "$pkgdir/usr/share/kglobalaccel/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
