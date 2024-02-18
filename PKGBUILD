# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tomlq-git
pkgver=r5.66b1ee6
pkgrel=1
pkgdesc='Tool for getting data from TOML files'
arch=(x86_64)
url=https://github.com/jamesmunns/tomlq
license=(MIT)
makedepends=(cargo git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=(!lto)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  printf "r%s.%s" "$(git -C $pkgname rev-list --count HEAD)" "$(git -C $pkgname rev-parse --short=7 HEAD)"
}

prepare() {
  RUSTUP_TOOLCHAIN=stable cargo fetch --locked --manifest-path=$pkgname/Cargo.toml --target="$CARCH-unknown-linux-gnu"
}

build() {
  RUSTUP_TOOLCHAIN=stable cargo build --release --manifest-path=$pkgname/Cargo.toml --target-dir=$pkgname/target --all-features
}

check() {
  RUSTUP_TOOLCHAIN=stable cargo test --release --manifest-path=$pkgname/Cargo.toml --target-dir=$pkgname/target
}

package() {
  install -Dm755 "$pkgname/target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
