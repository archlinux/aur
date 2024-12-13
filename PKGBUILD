# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Jonas Frei <freijon@gmail.com>

pkgname=ncmpvc-git
pkgver=0.0.1.r26.35bab73
pkgrel=3
pkgdesc='Ncurses IPC client for mpv, written in Rust'
arch=(x86_64)
url=https://gitlab.com/mpv-ipc/ncmpvc
license=(MIT)
depends=(mpv)
makedepends=(cargo git)
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
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  sed -i 's/fn error(&self, &str);/fn error(\&self, msg: \&str);/' src/main.rs
  sed -i 's/macro_rules! println_stderr(/#[allow(unused_macros)]\n&/' src/macros.rs
}

build() {
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cd $pkgname
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname
  cargo test --frozen --all-features
}

package() {
  install -Dm755 "$pkgname/target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname/res/logo.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
