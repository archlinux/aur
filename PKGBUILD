# # Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-x11-gesture-daemon
_name=gesture_improvements_gesture_daemon
pkgver=0.1.3+1+ga132f8d
pkgrel=1
pkgdesc="GNOME gesture improvements daemon"
arch=('x86_64')
url="https://github.com/harshadgavali/gnome-x11-gesture-daemon"
license=('MIT')
depends=('libinput')
makedepends=('cargo' 'git' 'setconf')
install="$pkgname.install"
_commit=a132f8d5da845ec2dc2048d0f569524537f1bc45
source=("git+https://github.com/harshadgavali/gnome-x11-gesture-daemon.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  setconf "$_name.service" ExecStart "/usr/bin/$_name"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/$_name" -t "$pkgdir/usr/bin/"
  install -Dm644 "$_name.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
