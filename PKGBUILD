# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=scu-git
pkgver=1.4.0.r64.gf41ac1b
pkgrel=1
pkgdesc="System fetch utility is aimed at informativeness"
arch=(i686 x86_64)
url="https://gitlab.com/omnid/${pkgname%-git}"
license=(GPL-3.0-or-later)
depends=(
  glibc
  gcc-libs
)
makedepends=(
  git
  rust
)
options=(!debug !lto)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd ${pkgname%-git}
  export CARGO_HOME="$srcdir"/.cargo
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${pkgname%-git}
  export CARGO_HOME="$srcdir"/.cargo
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd ${pkgname%-git}
  install -vDm755 target/release/${pkgname%-git} -t "$pkgdir"/usr/bin/
}
