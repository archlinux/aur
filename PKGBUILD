# Maintainer: Reece Standen <reece4277@users.noreply.github.com>

pkgname=phantomfido
pkgver=0.1.0
pkgrel=1
pkgdesc="FIDO caBLE v2 hybrid transport daemon bridging Linux browser WebAuthn to mobile passkeys"
arch=('x86_64' 'aarch64')
url="https://github.com/reece4277/phantomfido"
license=('AGPL-3.0-or-later')
depends=('bluez' 'dbus' 'openssl' 'libx11' 'gcc-libs' 'glibc')
makedepends=('cargo' 'git' 'pkgconf')
optdepends=(
  'wayland: native Wayland backend for the QR code window'
  'libxkbcommon: keyboard handling for the Wayland backend'
  'xorg-xwayland: run the X11 QR code window under a Wayland compositor'
)
install="$pkgname.install"
# minifb builds src/native/posix/scalar.c with cc(1); under makepkg's global LTO
# gcc emits LTO bitcode that rust-lld cannot read, so every scalar symbol comes
# out undefined at link time.
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "$pkgname.sysusers"
)
sha256sums=(
  '7631d9979783c49b6540fe940c906ed6a72b80cc25cea7f2ba5b433e1dc203ba'
  '55f76b8dc4703b4ac98a6aa67260cb4c4b5f450e0abcd265c58b7adf17c246be'
)

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # Cargo.lock is committed, so --locked keeps the AUR build reproducible.
  # One dependency (webauthn-authenticator-rs) is a pinned git revision, hence
  # the `git` makedepend.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The one #[ignore]d test opens a real GUI window and needs a display server,
  # so it stays out of the packaging build.
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 udev/99-phantomfido-uhid.rules \
    "$pkgdir/usr/lib/udev/rules.d/99-phantomfido-uhid.rules"

  install -Dm644 systemd/phantomfidod.service \
    "$pkgdir/usr/lib/systemd/user/phantomfidod.service"
  # The in-tree unit is a template pointing at a manual /usr/local install.
  sed -i 's|/usr/local/bin/phantomfido|/usr/bin/phantomfido|' \
    "$pkgdir/usr/lib/systemd/user/phantomfidod.service"

  # The shipped udev rule assigns /dev/uhid to the `uhid` group, which is not a
  # stock Arch group; systemd-sysusers creates it on install.
  install -Dm644 "$srcdir/$pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 BUILD.md "$pkgdir/usr/share/doc/$pkgname/BUILD.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
