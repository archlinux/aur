# Maintainer: Kevin Masson <hi@oktomus.com>
# Maintainer: Alex Hirzel <alex at hirzel period us>
# Maintainer: Chuyan Zhang <develop@zcy.moe>

_pkgname=tev
pkgname=${_pkgname}-git
pkgver=v2.3.2.r14.bbf2669
pkgrel=1
pkgdesc="High dynamic range (HDR) image comparison tool for graphics people. Supports primarily OpenEXR files."
arch=("i686" "x86_64")
url="https://github.com/Tom94/tev"
license=('LicenseRef-BSD')
depends=("hicolor-icon-theme" "jbigkit" "libc++" "libc++abi" "libdeflate" "libglvnd" "libpng" "libwebp" "libxrandr" "libxinerama" "libxcursor" "libxi")
makedepends=("clang" "cmake" "git" "ninja")
provides=("tev")
conflicts=("tev")
install=
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")


pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  git -C "${_pkgname}" submodule update --init --recursive
  mkdir -p "${_pkgname}/build"
}

build() {
  export CXXFLAGS="$CXXFLAGS -nostdinc++ -I/usr/include/c++/v1"

  cd "${_pkgname}/build" || exit 1
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
