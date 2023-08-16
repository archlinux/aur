# Maintainer: Kevin Masson <hi@oktomus.com>
_pkgname=tev
pkgname=${_pkgname}
pkgver=1.26
pkgrel=1
epoch=
pkgdesc="High dynamic range (HDR) image comparison tool for graphics people. Supports primarily OpenEXR files."
arch=("i686" "x86_64")
url="https://github.com/Tom94/tev"
license=('BSD')
depends=("libpng" "hicolor-icon-theme" "libglvnd")
makedepends=("cmake" "git" "clang")
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
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    ..
  cmake --build .
}

package() {
  cmake --build "${_pkgname}/build" --target install -- DESTDIR="${pkgdir}"
  install -Dm644 "${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
