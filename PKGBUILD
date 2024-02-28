# Maintainer: quietvoid <tcChlisop0@gmail.com>

_pkgname=libdovi
pkgname=lib32-${_pkgname}
pkgver=3.2.0
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
sha256sums=(
  '23c339b08bf32b66144b8fe17bf9a39f2dc810a37f081e5bc50207af9ae99922'
  '20f1168e3ad003502031578246a6f8f61a73f53cd2b00b583f944fda0dea2654'
)
_rootdir="dovi_tool-${_pkgtag}"

prepare() {
  cd "${_rootdir}"
  patch -Np1 -i "${srcdir}/0001-lib32-libdovi-remove-subdirectory.patch"

  cargo fetch \
    --manifest-path dolby_vision/Cargo.toml
}

build() {
  cargo cbuild --target i686-unknown-linux-gnu \
    --release \
    --frozen \
    --prefix=/usr \
    --libdir /usr/lib32 \
    --includedir /usr/include/"${_pkgname}"32 \
    --manifest-path ${_rootdir}/dolby_vision/Cargo.toml
}

check() {
  cargo test --target i686-unknown-linux-gnu \
    --release \
    --frozen \
    --all-features \
    --manifest-path ${_rootdir}/dolby_vision/Cargo.toml
}

package() {
  cd "${_rootdir}/dolby_vision"

  cargo cinstall --target i686-unknown-linux-gnu \
    --release \
    --frozen \
    --prefix /usr \
    --libdir /usr/lib32 \
    --includedir /usr/include/"${_pkgname}"32 \
    --destdir "${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
