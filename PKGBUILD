# Maintainer: tocic <tocic at protonmail dot ch>

pkgname=thor-git
pkgver=2.0.r24.g3e320cb
pkgrel=3
pkgdesc="SFML Extension with various game programming features,
         like particles, animations, vector operations"
arch=("x86_64")
url="https://bromeon.ch/libraries/thor"
license=("Zlib")
depends=("sfml")
makedepends=("cmake" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/Bromeon/Thor.git#branch=master"
        "fix_cmake_module_path.patch")
b2sums=("SKIP"
        "b1f082ce989d78abb14ad4615b1babce229f3e245409cbb820bdfd7693e9870ec86a5a586908a5b0d50576d67dd49c585928cf3f4bc94510d9615af7b64c9009")

pkgver() {
  printf "%s" \
    $(git -C "${pkgname}" describe --long --tags \
      | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g")
}

prepare() {
  patch --forward --strip=1 \
    --directory="${pkgname}" \
    --input="${srcdir}/fix_cmake_module_path.patch"
}

build() {
  cmake -B "build/" -S "${pkgname}" \
    -D THOR_BUILD_DOC:BOOL="OFF" \
    -D THOR_BUILD_EXAMPLES:BOOL="OFF" \
    -D THOR_SHARED_LIBS:BOOL="ON" \
    -D CMAKE_BUILD_TYPE:STRING="Release" \
    -D CMAKE_CXX_FLAGS_RELEASE:STRING="-DNDEBUG" \
    -D CMAKE_INSTALL_PREFIX:PATH="/usr/" \
    -Wno-dev

  cmake --build "build/"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build/"

  install -D --target-directory="${pkgdir}/usr/share/licenses/${pkgname}/" \
    --mode=644 \
    "${pkgdir}/usr/share/doc/Thor/LicenseAurora.txt" \
    "${pkgdir}/usr/share/doc/Thor/LicenseThor.txt"
}
