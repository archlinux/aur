# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_setPrefix="/usr"
_setLibdir="lib32"
_setFullLibdir="${_setPrefix}/${_setLibdir}"
_pkgbasename=glslang

pkgname=lib32-$_pkgbasename
pkgver=15.1.0
pkgrel=1
pkgdesc='OpenGL and OpenGL ES shader front end and validator (32bit)'
arch=('x86_64')
url='https://github.com/KhronosGroup/glslang'
license=('BSD-3-Clause')
depends=(
  "$_pkgbasename>=$pkgver"
  'lib32-glibc'
  'lib32-gcc-libs'
  'lib32-spirv-tools'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'python'
  'spirv-headers'
)
options=('staticlibs')
source=(
  ${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/glslang/archive/${pkgver}.tar.gz
)
sha256sums=(
  '4bdcd8cdb330313f0d4deed7be527b0ac1c115ff272e492853a6e98add61b4bc'
)

prepare() {
  echo "Patching if needed"
  cd ${_pkgbasename}-${pkgver}

}

build() {
  export CCFLAGS="-m32"
  export CXXFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}-${pkgver}
  # we need fat LTO objects to not break consumers during linking
  export CXXFLAGS+=" -ffat-lto-objects"
  cmake \
    -Bbuild-static \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib32" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS:STRING=-m32 \
    -DALLOW_EXTERNAL_SPIRV_TOOLS=ON \
    -DBUILD_SHARED_LIBS=OFF
  cmake --build build-static

  cmake \
    -Bbuild-shared \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib32" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS:STRING=-m32 \
    -DALLOW_EXTERNAL_SPIRV_TOOLS=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DGLSLANG_TESTS=OFF
  cmake --build build-shared
}

check() {
  cd ${_pkgbasename}-${pkgver}

#  ninja -Cbuild-shared test
}

package() {
  cd ${_pkgbasename}-${pkgver}

  DESTDIR="${pkgdir}" cmake --install build-static
  DESTDIR="${pkgdir}" cmake --install build-shared

  cd "${pkgdir}/usr/lib32/"
  for lib in *.so; do
    ln -sf "${lib}" "${lib}.0"
  done

  for i in "${pkgdir}/usr/bin/"*; do
    mv "$i" "$i"32
  done

  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim: ts=2 sw=2 et: