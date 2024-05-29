# Maintainer: Sir-Photch <sir-photch at posteo dot me>
# Adapted from xwayland-satellite by Nebulosa <nebulosa2007-at-yandex-dot-ru>

_pkgname=xwayland-satellite
pkgname="$_pkgname-git"
pkgver=0.2.r9.g601223d
pkgrel=1
pkgdesc="Xwayland outside your Wayland - git version"
arch=(x86_64)
url="https://github.com/Supreeeme/$_pkgname"
license=(MPL-2.0)
depends=(
  gcc-libs
  glibc
  libxcb
  xcb-util-cursor
  xorg-server-xwayland
)
makedepends=(
  git
  clang
  rust
)
provides=($_pkgname)
conflicts=($_pkgname)
options=(!debug)
source=(git+$url.git)
b2sums=(SKIP)

pkgver() {
  cd $_pkgname
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir"/.cargo
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir"/.cargo
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  install -vDm755 $_pkgname/target/release/$_pkgname -t "$pkgdir"/usr/bin/
}
