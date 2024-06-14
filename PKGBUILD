# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=flatpak-ext-git
pkgver=0.1.3.r57.g8a6376c
pkgrel=1
pkgdesc="Tool for run flatpaks without installing them"
arch=(x86_64)
url="https://github.com/ryanabx/${pkgname%-git}"
license=(MIT)
depends=(
  flatpak
  gcc-libs
  glib2
  glibc
  openssl
)
makedepends=(
  clang
  git
  rust
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug)
source=(${pkgname%-git}::git+$url)
b2sums=('SKIP')

pkgver() {
  git -C ${pkgname%-git} describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd ${pkgname%-git}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir"/.cargo
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${pkgname%-git}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir"/.cargo
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd ${pkgname%-git}
  install -vDm755 target/release/flatpak-ext -t "$pkgdir"/usr/bin/
  install -vDm644 LICENSE                    -t "$pkgdir"/usr/share/licenses/$pkgname/
}
