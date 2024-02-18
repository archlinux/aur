# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Wesley Moore <wes@wezm.net>

pkgname=dutree-git
pkgver=0.2.18.r0.g44e877d
pkgrel=1
pkgdesc='Tool to analyze file system usage written in Rust'
arch=(x86_64)
url=https://github.com/nachoparker/dutree
license=(GPL3)
makedepends=(cargo git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dm755 "$pkgname/target/release/${pkgname%-git}" -t "$pkgdir/usr/bin/"
}
