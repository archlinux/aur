# Maintainer: erdii <me@erdii.engineering>
# Maintainer of non git version this was adapter from: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=wlr-which-key-git
_pkgname=${pkgname%"-git"}
pkgver=1.1.0.r8.gd201a57
pkgrel=1
pkgdesc="Keymap manager for wlroots-based compositors"
arch=(x86_64)
url="https://github.com/MaxVerevkin/${_pkgname}"
license=(GPL-3.0-only)
conflicts=('wlr-which-key')
provides=("wlr-which-key=${pkgver}")
depends=(
  cairo
  gcc-libs
  glib2
  glibc
  libxkbcommon
  pango
)
makedepends=(
  rust
  git
)
options=(!debug)
source=(wlr-which-key::git+$url)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd $_pkgname
  export CARGO_HOME="$srcdir"/$_pkgname/.cargo
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_pkgname
  export CARGO_HOME="$srcdir"/$_pkgname/.cargo
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd $_pkgname
  install -vDm755 target/release/$_pkgname -t "$pkgdir"/usr/bin/
}
