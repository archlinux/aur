# Maintainer: Jan Luca Oster <janluca.oster@proton.me>

pkgname=sirula-extended-git
_pkgname=sirula
pkgver=r87.ae9d39a
pkgrel=2
pkgdesc="An app launcher for wayland with cgroup support, close on unfocus and more smaller features"
arch=(x86_64)
url=https://github.com/jlo62/sirula
license=(GPL-3.0-or-later)
depends=(gtk-layer-shell)
makedepends=(cargo git)
provides=(sirula)
conflicts=(sirula)
source=("$_pkgname::git+https://github.com/jlo62/sirula.git")
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$_pkgname"

  install -Dm755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"
}
