# Maintainer: willemw <willemw12@gmail.com>
# Conributor: Daniel Menelkir <dmenelkir@gmail.com>

pkgname=wttrbar-git
pkgver=0.4.0.r0.gdfa1473
pkgrel=1
pkgdesc='Show the weather in Waybar, using the great wttr.io'
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
  cargo fetch --locked --manifest-path=$pkgname/Cargo.toml --target="$CARCH-unknown-linux-gnu"
}

build() {
  RUSTUP_TOOLCHAIN=stable cargo build --release --manifest-path=$pkgname/Cargo.toml --target-dir=target --all-features
}

check() {
  RUSTUP_TOOLCHAIN=stable cargo test --release --manifest-path=$pkgname/Cargo.toml --target-dir=target
}

package() {
  install -Dm0755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
}
