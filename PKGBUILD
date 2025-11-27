# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Daniel Menelkir <dmenelkir@gmail.com>

pkgname=wttrbar-git
pkgver=0.13.0.r0.g6727237
pkgrel=1
pkgdesc='Show the weather in Waybar, using the great wttr.in'
arch=(x86_64)
url=https://github.com/bjesus/wttrbar
license=(MIT)
makedepends=(cargo git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!lto)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname

  export RUSTUP_TOOLCHAIN=stable
  cargo update # Only in a VCS package build
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname

  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -Dm755 "$pkgname/target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
}
