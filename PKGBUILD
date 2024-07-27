# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=wlr-which-key
pkgver=1.0.1
pkgrel=1
pkgdesc="Keymap manager for wlroots-based compositors"
arch=(x86_64)
url="https://github.com/MaxVerevkin/$pkgname"
license=(GPL-3.0-only)
depends=(
  cairo
  gcc-libs
  glib2
  glibc
  libxkbcommon
  pango
)
makedepends=(rust)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('d09f9d470e5ff1f8279351511af659228ac17797a6839ee9826d63378f9a3063c238f17b77ac24b7612a314ecaf1bb8be0dd865512d896100a79ce621814ff62')

prepare() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 target/release/$pkgname -t "$pkgdir"/usr/bin/
  install -vDm644 README.md               -t "$pkgdir"/usr/share/doc/$pkgname/
}
