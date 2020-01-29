# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Varakh <varakh@varakh.de>
# Contributor: Florian Klink <flokli@flokli.de>

pkgbase=spotifyd
pkgname=('spotifyd' 'spotifyd-pulseaudio' 'spotifyd-dbus-mpris' 'spotifyd-full')
pkgver=0.2.24
pkgrel=1
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
depends=('alsa-lib' 'libogg' 'gcc-libs')
makedepends=('cargo' 'libpulse' 'dbus')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/$pkgbase"
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Spotifyd/$pkgbase/archive/v$pkgver.tar.gz")
sha256sums=('d3763f4647217a8f98ee938b50e141d67a5f3d33e9378894fde2a92c9845ef80')
_features=(''
  'pulseaudio_backend'
  'dbus_mpris'
  'pulseaudio_backend,dbus_mpris,dbus_keyring,rodio_backend'
)

build() {
  cd "$srcdir/spotifyd-$pkgver"
  # Compile all variants. Compilation for later features can reuse
  # previous build artifacts, so little overhead.
  for feature in "${_features[@]}"; do
    cargo build --release --locked --features "$feature"
  done
}

_package_feature() {
  # Create a package for a particular feature.
  cargo install --locked --root "$pkgdir/usr" --path "$srcdir/$pkgbase-$pkgver" --features "$1"
  rm "$pkgdir/usr/.crates.toml"
  install -D -m 644 "$srcdir/$pkgbase-$pkgver/contrib/spotifyd.service" "$pkgdir/usr/lib/systemd/user/spotifyd.service"
}

package_spotifyd() {
  _package_feature "" # no features
}

package_spotifyd-pulseaudio() {
  depends=(libpulse)
  conflicts=(spotifyd)
  provides=(spotifyd)
  pkgdesc="$pkgdesc, with pulseaudio support"
  _package_feature pulseaudio_backend
}

package_spotifyd-dbus-mpris() {
  depends=(alsa-lib libogg dbus)
  conflicts=(spotifyd)
  provides=(spotifyd)
  pkgdesc="$pkgdesc, with D-Bus MPRIS"
  _package_feature dbus_mpris
}

package_spotifyd-full() {
  depends=(libpulse dbus)
  conflicts=(spotifyd)
  provides=(spotifyd)
  pkgdesc="$pkgdesc, with all Linux features enabled"
  _package_feature "${_features[3]}"
}
