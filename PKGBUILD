# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Jonas Frei <freijon@gmail.com>

pkgname=ncmpvc-git
pkgver=0.0.1.r26.35bab73
pkgrel=2
pkgdesc="Ncurses IPC client for mpv, written in Rust"
arch=('x86_64')
url="https://gitlab.com/mpv-ipc/ncmpvc"
license=('MIT')
depends=('mpv')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "%s.r%s.%s" "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i 's/fn error(&self, &str);/fn error(\&self, msg: \&str);/' $pkgname/src/main.rs
  sed -i 's/macro_rules! println_stderr(/#[allow(unused_macros)]\n&/' $pkgname/src/macros.rs
}

build() {
  RUSTUP_TOOLCHAIN=stable cargo build --release --all-features --manifest-path=$pkgname/Cargo.toml --target-dir=target
}

check() {
  RUSTUP_TOOLCHAIN=stable cargo test --release --manifest-path=$pkgname/Cargo.toml --target-dir=target
}

package() {
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname/res/logo.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}

