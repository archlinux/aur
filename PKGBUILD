# Maintainer: Kit Collver <archlinux.removed117@passmail.net>
pkgname=proteus-net
pkgver=1.0.0
pkgrel=1
pkgdesc="Shapeshifting network identity for Linux — rotates MAC, DHCP, IPv6, and hostname identifiers"
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
makedepends=('rust' 'cargo')
conflicts=('proteus')  # the unrelated AUR audio-visual game (also installs /usr/bin/proteus)
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0ae011fb392a915a82ef280db02ff59a69f0313b84029c11dca8b09025ead0a5')

prepare() {
  cd "Proteus-$pkgver"
  # If rust-toolchain.toml pins a non-stable channel, neutralize it
  # so we build against the system rust from extra/.
  [ -f rust-toolchain.toml ] && mv rust-toolchain.toml rust-toolchain.toml.disabled
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Proteus-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "Proteus-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # Some integration tests need root / NM / sysfs writes — keep unit tests only.
  cargo test --frozen --release --lib
}

package() {
  cd "Proteus-$pkgver"
  install -Dm755 target/release/proteus "$pkgdir/usr/bin/proteus"

  # systemd units shipped under dist/systemd/
  if [ -d dist/systemd ]; then
    for u in dist/systemd/*.service dist/systemd/*.timer; do
      [ -e "$u" ] && install -Dm644 "$u" "$pkgdir/usr/lib/systemd/system/$(basename "$u")"
    done
  fi

  # Shell completions emitted by the binary itself
  install -d "$pkgdir/usr/share/bash-completion/completions"
  install -d "$pkgdir/usr/share/zsh/site-functions"
  install -d "$pkgdir/usr/share/fish/vendor_completions.d"
  ./target/release/proteus completions bash > "$pkgdir/usr/share/bash-completion/completions/proteus"
  ./target/release/proteus completions zsh  > "$pkgdir/usr/share/zsh/site-functions/_proteus"
  ./target/release/proteus completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/proteus.fish"

  # Docs + license
  install -Dm644 README.md     "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md  "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 SECURITY.md   "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
  install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
