_pkgname=qdre-viewer
pkgname=${_pkgname}-git
pkgver=2.0.r8.g3a169b0
pkgrel=1
pkgdesc='Simple image viewer with wide-gamut and 10-bit support'
arch=('x86_64')
url='https://github.com/zaps166/qdre-viewer'
license=('BSD-3-Clause')
depends=('qt6-base' 'qt6-declarative' 'exiv2')
makedepends=('ninja' 'clang' 'llvm' 'git' 'qt6-tools' 'cmake')
optdepends=('qt6-imageformats: more image formats'
            'kimageformats: more image formats')
source=("git+${url}.git")
sha256sums=('SKIP')
options=(!lto !debug)

pkgver() {
  cd ${_pkgname}
  printf "%s.r%s.g%s" "$(sed -n '/^project(/,/^)/s/^    VERSION \([0-9.]*\)$/\1/p' CMakeLists.txt)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B "build" -S "${_pkgname}" \
    -G Ninja \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  time cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
