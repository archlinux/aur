# Maintainer: Kit Collver <archlinux.removed117@passmail.net>
pkgname=proteus-net-git
_pkgname=proteus-net
pkgver=1.0.0.r0.g0000000
pkgrel=1
pkgdesc="Shapeshifting network identity for Linux — rotates MAC, DHCP, IPv6, and hostname identifiers (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/Kit3713/Proteus"
license=('GPL-3.0-or-later')
depends=('networkmanager' 'systemd' 'dbus' 'gcc-libs')
optdepends=(
  'bluez: Bluetooth identifier rotation and BLE RPA mode'
  'nftables: discovery-block firewall rules'
  'iw: RF scan and chipset inventory'
  'wireless-regdb: regulatory-domain change events'
)
makedepends=('git' 'rust' 'cargo')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "proteus")
options=('!lto')
source=("proteus::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd proteus
  # Format: <Cargo.toml version>.r<commits-since-tag>.g<short-sha>.
  local cargo_ver
  cargo_ver=$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)
  printf '%s.r%s.g%s' \
    "$cargo_ver" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd proteus
  [ -f rust-toolchain.toml ] && mv rust-toolchain.toml rust-toolchain.toml.disabled
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd proteus
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd proteus
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --lib
}

package() {
  cd proteus
  install -Dm755 target/release/proteus "$pkgdir/usr/bin/proteus"

  if [ -d dist/systemd ]; then
    for u in dist/systemd/*.service dist/systemd/*.timer; do
      [ -e "$u" ] && install -Dm644 "$u" "$pkgdir/usr/lib/systemd/system/$(basename "$u")"
    done
  fi

  install -d "$pkgdir/usr/share/bash-completion/completions"
  install -d "$pkgdir/usr/share/zsh/site-functions"
  install -d "$pkgdir/usr/share/fish/vendor_completions.d"
  ./target/release/proteus completions bash > "$pkgdir/usr/share/bash-completion/completions/proteus"
  ./target/release/proteus completions zsh  > "$pkgdir/usr/share/zsh/site-functions/_proteus"
  ./target/release/proteus completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/proteus.fish"

  install -Dm644 README.md     "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md  "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 SECURITY.md   "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
  install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
