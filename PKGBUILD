# Maintainer: taotieren <admin@taotieren.com>

pkgname=aish
pkgver=0.3.6
pkgrel=1
pkgdesc='Empower the Shell to think. Evolve Operations. '
arch=($CARCH)
url='https://github.com/AI-Shell-Team/aish'
license=('Apache-2.0')
provides=(
  ${pkgname}
)
conflicts=(
  ${pkgname}
)
replaces=()
depends=(
  sh
  glibc
  libgcc
)
makedepends=(
  git
  rust
)
optdepends=()
# install=${pkgname}.install
options=('!lto' '!debug' '!strip')
source=(
  "${pkgname}::git+${url}.git#tag=v${pkgver}"
)
sha256sums=('e28c98e56d1701f1eadaafc84977b1ecb39d04a2c56d04580966d6ed6af9f1ed')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}/${pkgname}"
  cargo fetch --locked --target host-tuple
  cargo fetch --target "$CARCH-unknown-linux-gnu"
  sed -i 's|\$(TARGET)/||g' Makefile 
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "${srcdir}"/${pkgname}/
  cargo build --release
}

# check() {
#   cd "${srcdir}"/${pkgname}/
#   ctest --test-dir build --output-on-failure
# }

package() {
  cd "${srcdir}"/${pkgname}/
  make DESTDIR="${pkgdir}" NO_BUILD=1 install
  install -vDm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
