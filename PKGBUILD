# Maintainer: KirottuM <arnovaara@gmail.com>
_pkgname="watershot"
pkgname="${_pkgname}-git"
pkgver=r14.cc79b48
pkgrel=1
pkgdesc="A simple wayland native screenshot tool."
arch=("x86_64")
url="github.com/Kirottu/watershot"
license=('GPL3')
depends=(grim)
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

