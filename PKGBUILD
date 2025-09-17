# Maintainer: WithoutAName <withoutaname@withoutaname.eu>
pkgname=clisweeper-git
_repo=clisweeper
_cmd=clisweeper
pkgver=1.0.0.r0.gd053064
pkgrel=1
pkgdesc="CLI client for minesweeper multiplayer"
arch=("x86_64")
url="https://github.com/WithoutAName25/$_repo"
license=("MIT")
depends=("gcc-libs" "glibc")
makedepends=("cargo" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
sha256sums=("SKIP")
options=("!lto")

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./')"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm755 "target/release/$_cmd" "$pkgdir/usr/bin/$_cmd"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
