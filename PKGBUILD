# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=mingw-w64-ctk-widgets-git
pkgver=0.1.0.r5382.f904f960
pkgrel=1
pkgdesc='A collection of Qt Widgets for usage in biomedical imaging applications (mingw-w64)'
url='https://github.com/commontk/CTK'
arch=('any')
license=('APACHE')
depends=('mingw-w64-qt5-tools' 'mingw-w64-qt5-xmlpatterns')
makedepends=('git' 'mingw-w64-cmake' 'qt5-base')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('mingw-w64-ctk')
source=('git://github.com/commontk/CTK.git')
sha512sums=('SKIP')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

pkgver() {
  cd CTK
  echo "$(grep "set(CTK_MAJOR_VERSION" CMakeLists.txt | cut -d ' ' -f2 | cut -d ')' -f1).$(grep "set(CTK_MINOR_VERSION" CMakeLists.txt | cut -d ' ' -f2 | cut -d ')' -f1).$(grep "set(CTK_PATCH_VERSION" CMakeLists.txt | cut -d ' ' -f2 | cut -d ')' -f1).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  echo 'set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive")' >> CTK/Libs/Core/CMakeLists.txt
  mkdir -p build
  cd build
  cmake \
    -DCTK_SUPERBUILD=OFF \
    -DCTK_QT_VERSION=5 \
    ../CTK
}

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCTK_SUPERBUILD=OFF \
      -DCTK_QT_VERSION=5 \
      -DCTK_LIB_Widgets=ON \
      -DBUILD_TESTING=OFF \
      -DDGraph_EXECUTABLE=../build/Utilities/DGraph/DGraph \
      -DCMAKE_BUILD_TYPE=Release \
      ../CTK
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "$pkgdir"/usr/${_arch}/lib/ctk-*/designer
    mkdir -p "$pkgdir"/usr/${_arch}/bin
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/ctk-*/*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/lib/ctk-*/*.dll
    cp "$pkgdir"/usr/${_arch}/lib/ctk-*/*.dll "$pkgdir"/usr/${_arch}/bin/
    cd "${srcdir}/CTK"
    cp \
      CMake/ctkFunctionGeneratePluginUseFile.cmake \
      CMake/ctkFunctionExtractPluginTargets.cmake \
      CMake/ctkFunctionGetAllPluginTargets.cmake \
      CMake/ctkFunctionGetTargetDependencies.cmake \
      CMake/ctkFunctionGetPluginDependencies.cmake \
      CMake/ctkMacroSetupPlugins.cmake \
      "$pkgdir"/usr/${_arch}/lib/ctk-*/CMake
  done
}
