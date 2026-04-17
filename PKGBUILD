pkgname=ember-notify
pkgver=0.1.0
pkgrel=1
pkgdesc='Notification daemon for i3/X11 with Eww integration'
arch=('x86_64')
url='https://github.com/Savanta/Ember'
license=('MIT')
depends=('cairo' 'dbus' 'sqlite' 'wmctrl')
makedepends=('cargo' 'rust' 'sqlite')
optdepends=('noto-fonts: default toast font'
            'eww: bar widget integration')
provides=('notification-daemon')
conflicts=('dunst' 'mako' 'deadd-notification-center')
install='ember-notify.install'

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bc8245ab1ad92947ad399e85e0ff4bb580c2ee5d996d1c9ddccc3e9b86abcff4')

_srcdir="Ember-$pkgver"

prepare() {
  cd "$_srcdir"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_srcdir"
  export CARGO_HOME="$srcdir/cargo-home"
  export SQLITE3_LIB_DIR="/usr/lib"
  export SQLITE3_INCLUDE_DIR="/usr/include"
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
