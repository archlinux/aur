# Maintainer: harshadgavali <harshadgavali5022 at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-x11-gesture-daemon
_name=gesture_improvements_gesture_daemon
pkgver=0.2.1
pkgrel=2
pkgdesc="GNOME gesture improvements daemon"
arch=('x86_64')
url="https://github.com/harshadgavali/gnome-x11-gesture-daemon"
license=('MIT')
depends=('libinput')
makedepends=('cargo' 'git' 'setconf')
install="$pkgname.install"
source=("git+https://github.com/harshadgavali/gnome-x11-gesture-daemon.git#tag=v$pkgver")
sha256sums=('85dd87b1ead0a84ef655e18c5c7113a1d8c7e9f858e05e983b513b09f0209e94')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  setconf "${_name}.service" ExecStart "/usr/bin/${_name}"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/${_name}" -t "$pkgdir/usr/bin/"
  install -Dm644 "${_name}.service" -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
