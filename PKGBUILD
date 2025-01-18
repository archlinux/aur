# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tomlq-git
pkgver=r21.3595292
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
  install -Dm755 "$pkgname/target/release/tq" -t "$pkgdir/usr/bin"
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
