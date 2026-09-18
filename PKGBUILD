# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=gnome-vram-booster
pkgver=0.7.0
pkgrel=2
pkgdesc='Dynamic VRAM prioritization for GNOME'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/gnome-vram-booster'
license=('GPL-3.0-or-later')
depends=('dmemcg-booster' 'libgcc' 'glibc')
makedepends=('cargo' 'glib2')
optdepends=('gnome-shell: the extension that reports the focused window')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7d64cf44eea144ec4dac0d790c89c0f03adf79a2d10adcdba0b98488c7c75a46')

_ext_uuid=vram-booster@local

prepare() {
  cd "$pkgname-$pkgver/daemon"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver/daemon"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver/daemon"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 daemon/target/release/$pkgname daemon/target/release/${pkgname}ctl -t "$pkgdir/usr/bin"
  install -Dm644 packaging/usr/lib/systemd/system/$pkgname.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 packaging/usr/share/dbus-1/system.d/org.gnome.VramBooster.conf -t "$pkgdir/usr/share/dbus-1/system.d"
  local ext="$pkgdir/usr/share/gnome-shell/extensions/$_ext_uuid"
  install -Dm644 extension/extension.js extension/prefs.js extension/metadata.json -t "$ext"
  install -Dm644 extension/schemas/*.gschema.xml -t "$ext/schemas"
  glib-compile-schemas "$ext/schemas"
}
