pkgname=neocmakelsp
pkgver=0.8.23
pkgrel=3.0
pkgdesc='CMake LSP implementation based on Tower and Tree-sitter'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/neocmakelsp'
license=('MIT')
makedepends=('git' 'ninja' 'meson' 'rust' 'python')
depends=('cmake')
source=(
    "${pkgname}-v${pkgver}.tar.gz::https://github.com/Decodetalkers/neocmakelsp/archive/refs/tags/v${pkgver}.tar.gz"
    "bash_completion.patch"
)
options+=(!lto)
sha256sums=(
   '3cbc9ce4b49a93a67137af0ebe619c7fa39998376cb5ae75baf53c38211fc6a0'
   '3f54e8060625bef9ae8b771bb3ccbb40f560052b3657794e04b6af0e83cb5e48'
)

prepare() {
  cd ${pkgname}-$pkgver
  patch -Np1 -i "$srcdir/bash_completion.patch"
}

build() {
  cd ${pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr/ \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd ${pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
