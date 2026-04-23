pkgname=ember-notify
pkgver=0.1.4
pkgrel=3
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
options=('!debug' '!lto')
install='ember-notify.install'

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cdacc88a198c636da067a11e54f7609976ce30fb05355a03aa2e275f17e71bb0')

_srcdir="Ember-$pkgver"

prepare() {
  cd "$_srcdir"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_srcdir"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  # Avoid OOM on smaller machines by forcing single-job rustc builds.
  export CARGO_BUILD_JOBS=1
  # Force libsqlite3-sys to use system sqlite via pkg-config instead of
  # compiling the bundled sqlite3.c (which sqlx's `sqlite` feature enables).
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  cargo build --release --offline
}

package() {
  cd "$_srcdir"

  install -Dm755 "$srcdir/target/release/ember"   "$pkgdir/usr/bin/ember"
  install -Dm644 config/default.toml              "$pkgdir/usr/share/ember/default.toml"
  install -Dm644 man/ember.1                      "$pkgdir/usr/share/man/man1/ember.1"
  install -Dm644 pkg/ember.service                "$pkgdir/usr/lib/systemd/user/ember.service"
  install -Dm644 pkg/ember-notify.install         "$pkgdir/usr/share/ember/ember-notify.install"

  # License placeholder — replace with actual LICENSE file when available
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
}
