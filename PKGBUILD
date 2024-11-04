# Maintainer: Kevin Masson <hi@oktomus.com>
# Maintainer: Alex Hirzel <alex@hirzel.us>
# Maintainer: Chuyan Zhang <develop@zcy.moe>

_pkgname=tev
pkgname=${_pkgname}
pkgver=1.28
pkgrel=1
pkgdesc="High dynamic range (HDR) image comparison tool for graphics people. Supports primarily OpenEXR files."
arch=("i686" "x86_64")
url="https://github.com/Tom94/tev"
license=('LicenseRef-BSD')
depends=("hicolor-icon-theme" "libc++" "libc++abi" "libdeflate" "libglvnd" "libpng")
makedepends=("clang" "cmake" "git")
provides=("tev")
conflicts=("tev")
install=
source=("${_pkgname}::git+${url}.git#tag=v${pkgver}")
md5sums=("SKIP")

prepare() {
  git -C "${_pkgname}" submodule update --init --recursive
  mkdir -p "${_pkgname}/build"
}

build() {
  cd "${_pkgname}/build" || exit 1
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DOPENEXR_INSTALL=OFF\
    -DOPENEXR_INSTALL_TOOLS=OFF \
    -DOPENEXR_INSTALL_PKG_CONFIG=OFF \
    -DIMATH_INSTALL=OFF \
    -DIMATH_INSTALL_PKG_CONFIG=OFF \
    -GNinja \
    ..
  cmake --build .
}

package() {
  cmake --build "${_pkgname}/build" --target install
  install -Dm644 "${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
