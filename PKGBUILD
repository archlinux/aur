# Maintainer: Edvin Bryntesson <aur@edvinbryntesson.se>
_pkgname="anyrun-provider"
pkgname="${_pkgname}-git"
pkgver=r13.330d00e
pkgrel=1
pkgdesc="The backend of Anyrun, loads Anyrun plugins and is used as the middleman between launchers and the plugins."
arch=("x86_64")
url="https://github.com/anyrun-org/anyrun-provider"
license=('GPL3')
makedepends=(git cargo)
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')
options=(!lto)
provides=(
    "${_pkgname}=$pkgver"
)
pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
}
