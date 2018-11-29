# Maintainer: Bert Peters <bert@bertptrs.nl>
# Contributor: Alexander Schäferdiek <alexander@schaeferdiek.eu>
# Contributor: Florian Klink <flokli@flokli.de>

pkgbase=spotifyd
pkgname=('spotifyd' 'spotifyd-pulseaudio' 'spotifyd-dbus-mpris')
pkgver=0.2.3
pkgrel=2
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('alsa-lib' 'libogg' 'gcc-libs')
makedepends=('cargo' 'libpulse')
pkgdesc="A spotify playing daemon"
url="https://github.com/Spotifyd/$pkgbase"
source=("$pkgbase-$pkgver.tar.gz::https://github.com/Spotifyd/$pkgbase/archive/v$pkgver.tar.gz")
sha256sums=('619f5270023e70b3fb8329b9b8995800833768850014e320c734c067fce4b1b5')

prepare() {
  cd "$srcdir/spotifyd-$pkgver"
}

build() {
  cd "$srcdir/spotifyd-$pkgver"
  cargo build --release --locked
  # Compile any remaining libraries features
  cargo build --release --locked --features pulseaudio_backend,dbus_mpris
}

package_spotifyd() {
  cargo install --locked --root "$pkgdir/usr" --path "$srcdir/$pkgbase-$pkgver"
  rm "$pkgdir/usr/.crates.toml"
  install -D -m 644 "$srcdir/$pkgbase-$pkgver/contrib/spotifyd.service" "$pkgdir/usr/lib/systemd/user/spotifyd.service"
}

package_spotifyd-pulseaudio() {
  depends=(libpulse)
  conflicts=(spotifyd)
  pkgdesc="$pkgdesc, with pulseaudio support"
  cargo install --locked --root "$pkgdir/usr" --path "$srcdir/$pkgbase-$pkgver" --features pulseaudio_backend
  rm "$pkgdir/usr/.crates.toml"
  install -D -m 644 "$srcdir/$pkgbase-$pkgver/contrib/spotifyd.service" "$pkgdir/usr/lib/systemd/user/spotifyd.service"
}

package_spotifyd-dbus-mpris() {
  conflicts=(spotifyd)
  pkgdesc="$pkgdesc, with D-Bus MPRIS"
  cargo install --locked --root "$pkgdir/usr" --path "$srcdir/$pkgbase-$pkgver" --features dbus_mpris
  rm "$pkgdir/usr/.crates.toml"
  install -D -m 644 "$srcdir/$pkgbase-$pkgver/contrib/spotifyd.service" "$pkgdir/usr/lib/systemd/user/spotifyd.service"
}
