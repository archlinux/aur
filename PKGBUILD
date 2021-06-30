# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Jonas Frei <freijon@gmail.com>

pkgname=ncmpvc-git
pkgver=0.0.1.r6.5346112
pkgrel=1
pkgdesc="Ncurses IPC client for mpv written in Rust"
arch=('x86_64')
url="https://gitlab.com/mpv-ipc/ncmpvc"
license=('MIT')
depends=('mpv' 'ncurses')
makedepends=('cargo')
provides=("${pkgname%-git}")                                                                                                                                                                                         
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=("$pkgname::git+$url.git" Cargo.lock)
sha256sums=('SKIP'
            '70fd6e887c4c311a85ae9a4d2c5f55ed85701dde1b14ba5309507752463cca65')

pkgver() {
  printf "%s.r%s.%s" "$(sed -n 's/^version = "\(.*\)"/\1/p' $pkgname/Cargo.toml)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i 's/fn error(&self, &str);/fn error(\&self, msg: \&str);/' $pkgname/src/main.rs
  sed -i 's/macro_rules! println_stderr(/#[allow(unused_macros)]\n&/' $pkgname/src/macros.rs
  cp -a Cargo.lock $pkgname
}

build() {
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --manifest-path=$pkgname/Cargo.toml --target-dir=target
}

check() {
  RUSTUP_TOOLCHAIN=stable cargo test --release --locked --manifest-path=$pkgname/Cargo.toml --target-dir=target
}

package() {
  install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname/res/logo.png "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}

