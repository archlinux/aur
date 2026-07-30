# Maintainer: Reece Standen <reece4277@users.noreply.github.com>

pkgname=phantomfido
pkgver=0.1.1
pkgrel=1
pkgdesc="FIDO caBLE v2 hybrid transport daemon bridging Linux browser WebAuthn to mobile passkeys"
arch=('x86_64' 'aarch64')
url="https://github.com/reece4277/phantomfido"
license=('AGPL-3.0-or-later')
# namcap flags bluez and libx11 as "may not be needed": neither is in the
# binary's NEEDED set. Both are deliberate -- bluez is reached over D-Bus at
# runtime, and minifb dlopen()s libX11 for the QR window.
depends=('bluez' 'dbus' 'openssl' 'libx11' 'libgcc' 'glibc')
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
  "$pkgname.modules-load"
)
sha256sums=(
  '39eb315fa7b5039b748f4527c47273cbe3af9a3767338c7285772a70df9d16d0'
  '55f76b8dc4703b4ac98a6aa67260cb4c4b5f450e0abcd265c58b7adf17c246be'
  '58e43222b81de11baa62712c64fc198a4d4071c429b70041c60b1e41b27017a2'
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

  # Nothing on a stock Arch system autoloads uhid, so /dev/uhid would never
  # appear and the udev rule above would have nothing to act on.
  install -Dm644 "$srcdir/$pkgname.modules-load" \
    "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 BUILD.md "$pkgdir/usr/share/doc/$pkgname/BUILD.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
