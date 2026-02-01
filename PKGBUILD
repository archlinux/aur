# Maintainer: quietvoid <tcChlisop0@gmail.com>

_pkgname=libdovi
pkgname=lib32-${_pkgname}
pkgver=3.3.2
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
  '8ccb1922d7dbb57bc4f2c15c10b90c462f7a5f292efe317c116db923728dd3f1'
  '20f1168e3ad003502031578246a6f8f61a73f53cd2b00b583f944fda0dea2654'
)
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
