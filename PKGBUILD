# Maintainer: sachesi <xsachesi@pm.me>

# pkgver and sha256sums are filled in by .github/workflows/aur.yml for each release.
pkgname=gnome-vram-booster
pkgver=0.7.5
pkgrel=1
pkgdesc='Dynamic VRAM prioritization for GNOME'
arch=('x86_64' 'aarch64')
url='https://github.com/sachesi/gnome-vram-booster'
license=('GPL-3.0-or-later')
depends=('dmemcg-booster' 'libgcc' 'glibc')
makedepends=('cargo' 'glib2')
optdepends=('gnome-shell: the extension that reports the focused window')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ed7de12fa57d14626561c677369f610ca8a49e08cddcc5d6491fa887b253c534')

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
  install -Dm755 daemon/target/release/$pkgname -t "$pkgdir/usr/lib/$pkgname"
  install -Dm755 daemon/target/release/${pkgname}ctl -t "$pkgdir/usr/bin"
  install -Dm644 packaging/usr/lib/systemd/system/$pkgname.service -t "$pkgdir/usr/lib/systemd/system"
  # Arch keeps a package's private executables in /usr/lib/$pkgname, not /usr/libexec.
  sed -i "s|^ExecStart=/usr/libexec/$pkgname$|ExecStart=/usr/lib/$pkgname/$pkgname|" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 packaging/usr/share/dbus-1/system.d/org.gnome.VramBooster.conf -t "$pkgdir/usr/share/dbus-1/system.d"
  local ext="$pkgdir/usr/share/gnome-shell/extensions/$_ext_uuid"
  install -Dm644 extension/extension.js extension/prefs.js extension/metadata.json -t "$ext"
  install -Dm644 extension/schemas/*.gschema.xml -t "$ext/schemas"
  glib-compile-schemas "$ext/schemas"
}
