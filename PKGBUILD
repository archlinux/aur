pkgname=mingw-w64-opencascade
pkgver=7.5.1
_pkgver=V7_5_1
pkgrel=1
pkgdesc="Open CASCADE Technology, 3D modeling & numerical simulation (mingw-w64)"
arch=('any')
url="https://www.opencascade.org"
license=('custom')
depends=('mingw-w64-tk' 'mingw-w64-ffmpeg' 'mingw-w64-freeimage' 'mingw-w64-onetbb' 'mingw-w64-rapidjson')
#TODO: 'mingw-w64-vtk'
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("opencascade-${pkgver}.tgz::https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=refs/tags/${_pkgver};sf=tgz"
        'fix-install-dir-references.patch')
sha256sums=('3a43d8b50df78ade72786fa63bc8808deac6380189333663e7b4ef8558ae7739'
            'afb584aa453993ae8d9e2b983594558531ede735a5892754b812be30650c9fb5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "occt-${_pkgver}"
  patch -Np1 -i "$srcdir/fix-install-dir-references.patch"

  # cross paths
  sed -i "s|CMAKE_FIND_ROOT_PATH_BOTH||g" adm/cmake/*.cmake
  sed -i "s|NO_DEFAULT_PATH||g" adm/cmake/*.cmake

  # wrong lib name .
  sed -i "s|CSF_FreeImagePlus|FreeImage|g" adm/cmake/freeimage.cmake

  # dont ignore linker flags
  sed -i 's|set (CMAKE_SHARED_LINKER_FLAGS "-Wl,--export-all-symbols")|set (CMAKE_SHARED_LINKER_FLAGS "-Wl,--export-all-symbols \${CMAKE_SHARED_LINKER_FLAGS}")|g' adm/cmake/occt_defs_flags.cmake

  # find .dll.a extension
  sed -i 's|set (CMAKE_FIND_LIBRARY_SUFFIXES |#set (CMAKE_FIND_LIBRARY_SUFFIXES |g' adm/cmake/*.cmake

  # msvc-specific inline asm syntax
  sed -i "s|defined(_M_IX86)|defined(_MSC_VER)|g" src/Standard/Standard.cxx
}

build() {
  cd "occt-${_pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DUSE_FREEIMAGE=ON \
      -DUSE_FFMPEG=ON \
      -DUSE_VTK=OFF \
      -DUSE_RAPIDJSON=ON \
      -DUSE_TBB=ON \
      -DBUILD_DOC_Overview=OFF \
      -D3RDPARTY_FREEIMAGE_LIBRARY_freeimage=/usr/${_arch}/lib/libFreeImage.dll.a \
      -DINSTALL_DIR_BIN=bin \
      -DINSTALL_DIR_LIB=lib \
      -DINSTALL_DIR_DATA=share/opencascade/data \
      -DINSTALL_DIR_CMAKE=lib/cmake \
      -DINSTALL_DIR_INCLUDE=include \
      -DINSTALL_DIR_SAMPLES=share/opencascade/samples \
      -DINSTALL_DIR_SCRIPT=share/opencascade/script \
      -DINSTALL_DIR_RESOURCE=share/opencascade/resources \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/occt-${_pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/*.txt
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
