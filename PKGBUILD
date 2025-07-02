# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=wlr-which-key
pkgver=1.3.0
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
sha512sums=('980ebfd33dd7e20aa314c81972d6497ca7592265b2574c6f6c33ad0404f6008406c36edb7dedb076c370ba1591fc70b46ca61d6014fa067c99ddd05af54bcb89')
b2sums=('fa6a0c1ba976134becf5061e7a599db9b56e8f13ee608da6f7769e767cff9906bb4e697280d9d27e38790a94d964568ca1fd5a899e92b59e14ee1e6c3f5203cd')

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
}
