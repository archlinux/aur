pkgname=ember-notify
pkgver=0.1.2
pkgrel=1
pkgdesc='Notification daemon for i3/X11 with Eww integration'
arch=('x86_64')
url='https://github.com/Savanta/Ember'
license=('MIT')
depends=('cairo' 'dbus' 'libcanberra' 'sqlite' 'wmctrl')
makedepends=('cargo' 'rust' 'sqlite')
optdepends=('noto-fonts: default toast font'
            'eww: bar widget integration')
provides=('notification-daemon')
conflicts=('dunst' 'mako' 'deadd-notification-center')
install='ember-notify.install'

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8a128f2e0d6bd3f7a8a80be27024e2e85a76c3e6a0c1d23571135d041f47b91')

_srcdir="Ember-$pkgver"

prepare() {
  cd "$_srcdir"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_srcdir"
  export CARGO_HOME="$srcdir/cargo-home"
  # Force libsqlite3-sys to use system sqlite via pkg-config instead of
  # compiling the bundled sqlite3.c (which sqlx's `sqlite` feature enables).
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  cargo build --release --locked --offline
}

package() {
  cd "$_srcdir"

  install -Dm755 target/release/ember             "$pkgdir/usr/bin/ember"
  install -Dm644 config/default.toml              "$pkgdir/usr/share/ember/default.toml"
  install -Dm644 man/ember.1                      "$pkgdir/usr/share/man/man1/ember.1"
  install -Dm644 pkg/ember.service                "$pkgdir/usr/lib/systemd/user/ember.service"
  install -Dm644 pkg/ember-notify.install         "$pkgdir/usr/share/ember/ember-notify.install"

  # License placeholder — replace with actual LICENSE file when available
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
}
