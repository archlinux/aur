# Maintainer: quietvoid <tcChlisop0@gmail.com>

_pkgname=libdovi
pkgname=lib32-${_pkgname}
pkgver=3.4.0
pkgrel=1
pkgdesc='Library to read and write Dolby Vision metadata C-API (32-bit)'
_pkgtag="libdovi-${pkgver}"
arch=('x86_64')
url='https://github.com/quietvoid/dovi_tool/tree/main/dolby_vision'
license=('MIT')
depends=('lib32-gcc-libs' 'lib32-glibc')
makedepends=('cargo' 'cargo-c' 'lib32-rust-libs')
provides=('libdovi.so')
source=(
  "https://github.com/quietvoid/dovi_tool/archive/refs/tags/${_pkgtag}.tar.gz"
  "0001-lib32-libdovi-remove-subdirectory.patch"
)
b2sums=('4d93c26f201978a8e701fedd627ebd4b5109b1248273e4bfcc5efcaf29994b644ea53cabb6b2c86a84aef5d76c4bf66046f29903b8fe53bb43011be688e98ab4'
        '6ce9754a6206145e866ecfe6f57eac901da2e967b2a4d8de2538bee4c18744fb615bc3fe29a78b0d7a98fa34fdd2acd69ff0e97d3b9435db249e023c4134d060')
_rootdir="dovi_tool-${_pkgtag}"
_targettuple="i686-unknown-linux-gnu"

prepare() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_rootdir}"
  patch -Np1 -i "${srcdir}/0001-lib32-libdovi-remove-subdirectory.patch"

  cd dolby_vision
  cargo fetch --locked --target "${_targettuple}"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cd "${_rootdir}/dolby_vision"
  cargo cbuild --target "${_targettuple}" \
    --frozen \
    --profile release-deploy \
    --prefix=/usr \
    --libdir /usr/lib32 \
    --includedir /usr/include/"${_pkgname}"32
}

check() {
  export RUSTUP_TOOLCHAIN=stable

  cd "${_rootdir}/dolby_vision"
  cargo test --target "${_targettuple}" --frozen --all-features
}

package() {
  export CARGO_TARGET_DIR=target

  cd "${_rootdir}/dolby_vision"

  cargo cinstall --target "${_targettuple}" \
    --frozen \
    --profile release-deploy \
    --prefix /usr \
    --libdir /usr/lib32 \
    --includedir /usr/include/"${_pkgname}"32 \
    --destdir "${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
