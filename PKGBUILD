# Maintainer: maple
pkgname=wl-clip-persist-git
pkgver=r2.aea59e7
pkgrel=3
pkgdesc="Keep Wayland clipboard even after programs close"
arch=('any')
url="https://github.com/Linus789/wl-clip-persist"
license=('MIT')
provides=('wl-clip-persist')
conflicts=('wl-clip-persist')
depends=('wayland')
makedepends=('git' 'cargo' 'wayland-protocols')
source=("$pkgname::git+https://github.com/Linus789/wl-clip-persist.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="--remap-path-prefix=$HOME=/home --remap-path-prefix=$PWD=/src"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/wl-clip-persist" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/wl-clip-persist"
}
