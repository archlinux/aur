# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Frikilinux <frikilinux@gmail.com>

pkgname=transg-tui-git
pkgver=r36.ec5c53d
pkgrel=1
pkgdesc='Transmission remote TUI client'
arch=(x86_64)
url=https://github.com/PanAeon/transg-tui
license=(MIT)
makedepends=(cargo git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  #install -Dm755 $pkgname/target/release/transgression-tui -t "$pkgdir/usr/bin"
  install -Dm755 $pkgname/target/release/transgression-tui "$pkgdir/usr/bin/${pkgname%-git}"

  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
