# Maintainer: Kevin Masson <hi@oktomus.com>
# Maintainer: Alex Hirzel <alex at hirzel period us>
# Maintainer: Chuyan Zhang <develop at zcy dot moe>

_pkgname=tev
pkgname=${_pkgname}
pkgver=2.6.3
pkgrel=1
pkgdesc="High dynamic range (HDR) image viewer for people who care about colors"
arch=("i686" "x86_64" "arm")
url="https://github.com/Tom94/tev"
license=('GPL3')
depends=("hicolor-icon-theme" "libc++" "libc++abi" "libglvnd" "libxrandr" "libxinerama" "libxcursor" "libxi" "libxkbcommon" "wayland")
makedepends=("clang" "cmake" "git" "ninja" "wayland-protocols")
provides=("tev")
conflicts=("tev")
source=("${_pkgname}::git+${url}.git#tag=v${pkgver}")
md5sums=("SKIP")
OPTIONS=(!lto)

prepare() {
  git -C "${_pkgname}" submodule update --init --recursive
  mkdir -p "${_pkgname}/build"
}

build() {
  cd "${_pkgname}/build" || exit 1
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -GNinja \
    ..
  cmake --build .
}

package() {
  cmake --build "${_pkgname}/build" --target install
  install -Dm644 "${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
