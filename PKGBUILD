# Maintainer: KirottuM <arnovaara@gmail.com>
_pkgname="anyrun-plugin-symbols"
pkgname="${_pkgname}-git"
pkgrel=1
pkgver=1
pkgdesc="Symbols plugin for searching unicode symbols."
arch=("x86_64")
url="https://github.com/anyrun-org/plugin-symbols"
license=('GPL3')
depends=(anyrun)
makedepends=(git cargo)
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release 
}

package() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  install -Dm0644 -t "$pkgdir/etc/anyrun/plugins/" "target/release/libsymbols.so"
}
