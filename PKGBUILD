# Maintainer: quietvoid <tcChlisop0@gmail.com>

_pkgname=libdovi
pkgname=${_pkgname}-git
pkgver=3.2.0.r12.g13f32b3
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

pkgver() {
  cd dovi_tool

  git describe --match "libdovi-[0-9]*" --long HEAD --tags | sed 's/^libdovi-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cargo fetch \
    --manifest-path dovi_tool/dolby_vision/Cargo.toml
}

build() {
  cargo cbuild \
    --release \
    --frozen \
    --prefix=/usr \
    --manifest-path dovi_tool/dolby_vision/Cargo.toml
}

check() {
  cargo test \
    --release \
    --frozen \
    --all-features \
    --manifest-path dovi_tool/dolby_vision/Cargo.toml
}

package() {
  cd dovi_tool/dolby_vision

  cargo cinstall \
    --release \
    --frozen \
    --prefix /usr \
    --destdir "${pkgdir}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
