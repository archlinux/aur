# Maintainer: mochaaP <aur@mochaa.ws>

_pkgname=paperback
pkgname=${_pkgname}-git
_pkgver=0.0.0
pkgver=0.0.0.8512e5f
pkgrel=1
pkgdesc="Paper backup generator suitable for long-term storage."
url="https://github.com/cyphar/${_pkgname}"
arch=(${CARCH})
license=('GPL')
makedepends=('cargo' 'git')
_commit=8512e5fb74939e176a46cda9b0d38f0ee47bfa78
source=("git+${url}#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf ${_pkgver}.$(git describe --always | sed 's/^v//;s/-/+/g')
}

prepare() {
  cd ${_pkgname}
  cargo update
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd ${_pkgname}
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --all-features
}

check() {
  cd ${_pkgname}
  export RUSTUP_TOOLCHAIN=stable
  cargo test --all-features
}

package() {
  cd ${_pkgname}
  install -Dt "${pkgdir}/usr/bin" target/release/${_pkgname}
  install -Dt "${pkgdir}/usr/share/doc/${_pkgname}" -m644 README.md
}
