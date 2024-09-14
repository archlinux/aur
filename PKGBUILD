# Maintainer: gigas002 <gigas002@pm.me>

_pkgname="watershot"
pkgname="${_pkgname}-wayshot-git"
pkgver=r83.7b9723c
pkgrel=1
pkgdesc="Watershot fork with libwayshot instead of grim"
arch=("x86_64")
url="https://github.com/Gigas002/watershot"
license=('GPL3')
depends=(vulkan-driver)
makedepends=(git cargo)
provides=(${_pkgname})
conflicts=(${_pkgname})
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

