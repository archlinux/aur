pkgname=waft-settings-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Waft standalone settings application"
arch=('x86_64' 'aarch64')
url="https://github.com/readyplayernan/waft"
license=('MIT')
depends=('waft-git' 'gtk4' 'libadwaita')
makedepends=('cargo' 'git' 'rust')
provides=('waft-settings')
conflicts=('waft-settings')
options=('!lto')
source=("$pkgname::git+https://github.com/readyplayernan/waft.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin waft-settings
}

check() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen -p waft-settings
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/waft-settings" "$pkgdir/usr/bin/waft-settings"
  install -Dm644 "data/waft-settings.desktop" "$pkgdir/usr/share/applications/waft-settings.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
