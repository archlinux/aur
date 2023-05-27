# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co Maintainer: harshadgavali <harshadgavali5022 at gmail dot com>
pkgname=gnome-x11-gesture-daemon
_name=gesture_improvements_gesture_daemon
pkgver=0.2.1
pkgrel=1
pkgdesc="GNOME gesture improvements daemon"
arch=('x86_64')
url="https://github.com/harshadgavali/gnome-x11-gesture-daemon"
license=('MIT')
depends=('libinput')
makedepends=('cargo' 'git' 'setconf')
install="$pkgname.install"
_commit=38529d479ef086d7cd9005529061e96114bca4a9
source=("git+https://github.com/harshadgavali/gnome-x11-gesture-daemon.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  setconf "$_name.service" ExecStart "/usr/bin/$_name"
}

build() {
  cd "$srcdir/$pkgname"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/$_name" -t "$pkgdir/usr/bin/"
  install -Dm644 "$_name.service" -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
