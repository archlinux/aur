# Maintainer: Sir-Photch <sir-photch at posteo dot me>
# Adapted from xwayland-satellite by Nebulosa <nebulosa2007-at-yandex-dot-ru>

_pkgname=xwayland-satellite
pkgname="$_pkgname-git"
pkgver=0.2.r9.g601223d
pkgrel=2
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
source=(git+$url.git xwayland-satellite.service)
b2sums=('SKIP'
        '408c93c7c12e359e0ba48c08aea3f8a132452bcf2ad400a029115eb5fb4897e07e286bb9191d50835a26404ccf6496aeeb81d232d6222ae1af02750d0e6c4a39')

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
  install -Dm644 "$srcdir"/$_pkgname.service -t "$pkgdir"/usr/lib/systemd/user/
  install -Dm755 $_pkgname/target/release/$_pkgname -t "$pkgdir"/usr/bin/
}
