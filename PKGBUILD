# Maintainer: quietvoid <tcChlisop0@gmail.com>

_pkgname=libhdr10plus-rs
pkgname=${_pkgname}-git
pkgver=2.1.5.r3.g2ab405a
pkgrel=1
pkgdesc='Library to read and write HDR10+ metadata (C-API) - git version'
arch=('x86_64')
url='https://github.com/quietvoid/hdr10plus_tool/hdr10plus'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo' 'cargo-c')
conflicts=('libhdr10plus-rs')
provides=('libhdr10plus-rs' 'libhdr10plus-rs.so')
source=(git+https://github.com/quietvoid/hdr10plus_tool.git)
sha256sums=(SKIP)
_libdir="hdr10plus_tool/hdr10plus"

pkgver() {
  cd hdr10plus_tool

  git describe --match "libhdr10plus-[0-9]*" --long HEAD --tags | sed 's/^libhdr10plus-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_libdir}"
  cargo fetch --locked --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${_libdir}"
  cargo cbuild --frozen \
    --profile release-deploy \
    --prefix=/usr
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_libdir}"
  cargo test --frozen --all-features
}

package() {
  export CARGO_TARGET_DIR=target

  cd "${_libdir}"
  cargo cinstall --frozen \
    --profile release-deploy \
    --prefix /usr \
    --destdir "${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
