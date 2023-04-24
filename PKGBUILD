# Maintainer: KirottuM <arnovaara@gmail.com>
_pkgname="kidex"
pkgname="${_pkgname}-git"
pkgver=r5.cc28fce
pkgrel=1
pkgdesc="A simple file indexing service"
arch=("x86_64")
url="github.com/Kirottu/kidex"
license=('GPL3')
makedepends=(git cargo)
source=("${_pkgname}::git+https://$url.git")
sha256sums=('SKIP')
pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare() {
  cd "${srcdir}/${_pkgname}"
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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
}

