# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=xwayland-satellite
pkgver=0.5
pkgrel=2
pkgdesc="Xwayland outside your Wayland"
arch=(x86_64)
url="https://github.com/Supreeeme/$pkgname"
license=(MPL-2.0)
depends=(
  gcc-libs
  glibc
  libxcb
  xcb-util-cursor
  xorg-xwayland
)
makedepends=(
  clang
  rust
)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('b2ab19629c2b9d099af2c2dfa81a215acb1bc0ddc6a98574a05791cdcfeb980301c33657e4f5bbc4b64c30bc08e49e8f5fcb5fd82f8103d7dc1d25f10a20b5dc')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|ExecStart=/usr/local|ExecStart=/usr|' resources/$pkgname.service
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir"/.cargo
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir"/.cargo
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -F systemd
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 target/release/$pkgname    -t "$pkgdir"/usr/bin/
  install -vDm644 resources/$pkgname.service -t "$pkgdir"/usr/lib/systemd/user/
}
