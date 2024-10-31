# Maintainer: WithoutAName <withoutaname@withoutaname.eu>
pkgname=dot-manager-git
pkgver=0.2.2.r0.g76d20bd
pkgrel=1
pkgdesc="CLI Utility for easy dotfile management"
arch=("x86_64")
_repo=DotManager
url="https://github.com/WithoutAName25/$_repo"
license=("MIT")
depends=("gcc-libs" "glibc")
makedepends=("cargo" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
sha256sums=("SKIP")

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
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm755 target/release/dot-manager "$pkgdir/usr/bin/dot-manager"

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
