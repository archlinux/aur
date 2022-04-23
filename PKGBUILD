# Maintainer: Tuhana GAYRETLİ <tuhana at tuta dot io>
# shellcheck disable=SC2034,SC2148,SC2164,SC2154

pkgname=treefetch-git
_pkgname=${pkgname%-git}
pkgver=v2.0.0.r22.b7e52ea
pkgrel=1
pkgdesc="A lightning-fast system fetch tool built with Rust - Git version"
arch=(x86_64)
url="https://github.com/angelofallars/treefetch"
license=(GPL3)
makedepends=(cargo git)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/$_pkgname"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
