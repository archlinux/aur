# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=libdovi-git
pkgver=3.1.1.r0.geb8a664
pkgrel=1
pkgdesc='Library to read and write Dolby Vision metadata (C-API) - git version'
arch=('any')
url='https://github.com/quietvoid/dovi_tool/tree/main/dolby_vision'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo' 'cargo-c')
conflicts=('libdovi.so')
provides=('libdovi.so')
source=(git+https://github.com/quietvoid/dovi_tool.git)
sha256sums=(SKIP)

pkgver() {
  cd dovi_tool

  git describe --match "libdovi-[0-9]*" --long HEAD --tags | sed 's/^libdovi-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cargo fetch \
    --locked \
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

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/libdovi/LICENSE"
}
