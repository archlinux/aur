# Maintainer: quietvoid <tcChlisop0@gmail.com>

_pkgname=libdovi
pkgname=${_pkgname}-git
pkgver=3.3.2.r14.g25c397e
pkgrel=1
pkgdesc='Library to read and write Dolby Vision metadata (C-API) - git version'
arch=('x86_64')
url='https://github.com/quietvoid/dovi_tool/tree/main/dolby_vision'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo' 'cargo-c')
conflicts=('libdovi')
provides=('libdovi' 'libdovi.so')
source=(git+https://github.com/quietvoid/dovi_tool.git)
sha256sums=(SKIP)
_libdovidir="dovi_tool/dolby_vision"

pkgver() {
  cd dovi_tool

  git describe --match "libdovi-[0-9]*" --long HEAD --tags | sed 's/^libdovi-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_libdovidir}"
  cargo fetch --locked --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${_libdovidir}"
  cargo cbuild \
    --frozen \
    --profile release-deploy \
    --prefix=/usr
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_libdovidir}"
  cargo test --frozen --all-features
}

package() {
  export CARGO_TARGET_DIR=target

  cd "${_libdovidir}"
  cargo cinstall \
    --frozen \
    --profile release-deploy \
    --prefix /usr \
    --destdir "${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
