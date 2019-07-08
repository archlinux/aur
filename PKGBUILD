_pkgname=spirv-tools
pkgname="mingw-w64-${_pkgname}"
pkgver=2018.5
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules (mingw-w64)"
arch=('any')
url="https://www.khronos.org/vulkan/"
license=('custom')
groups=(vulkan-devel)
depends=()
makedepends=('mingw-w64-cmake' 'python' 'git')
source=("git+https://github.com/KhronosGroup/SPIRV-Tools.git#tag=v${pkgver}"
        git+https://github.com/KhronosGroup/SPIRV-Headers.git)
sha256sums=('SKIP'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd SPIRV-Tools

  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "build-${_arch}"-{shared,static}
    (cd "build-${_arch}-shared"
      ${_arch}-cmake .. \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DSPIRV_WERROR=Off \
        -DSPIRV-Headers_SOURCE_DIR=${srcdir}/SPIRV-Headers \
        -DBUILD_SHARED_LIBS=ON
      make)
    (cd "build-${_arch}-static"
      ${_arch}-cmake .. \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DSPIRV_WERROR=Off \
        -DSPIRV-Headers_SOURCE_DIR=${srcdir}/SPIRV-Headers \
        -DBUILD_SHARED_LIBS=OFF
      make)
  done
}

package() {
  cd SPIRV-Tools
  for _arch in ${_architectures}; do
    make -C build-${_arch}-shared DESTDIR="${pkgdir}" install
	make -C build-${_arch}-static DESTDIR="${pkgdir}" install
	find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
