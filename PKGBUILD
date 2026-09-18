# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=gnome-vram-booster
pkgver=0.6.2
pkgrel=1
pkgdesc='Dynamic VRAM prioritization for GNOME'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/gnome-vram-booster'
license=('GPL-3.0-or-later')
depends=('dmemcg-booster' 'libgcc' 'glibc')
makedepends=('cargo' 'glib2')
optdepends=('gnome-shell: the extension that reports the focused window')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('87c790e510a47468e560b166c49152b5dd900810dc69b2d71f2eaca386eb1251')

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
