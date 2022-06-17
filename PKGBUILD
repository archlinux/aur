# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: farid <farid at archlinuc-br.org>
# Contributor: Archie <Mymaud@gmail.com>

pkgname='gmic-no-opencv'
_basename="${pkgname%%-*}"
pkgver=3.1.3
pkgrel=2
pkgdesc="GREYC's Magic Image Converter (without OpenCV camera input processing)"
arch=('x86_64')
url='https://gmic.eu/'
license=('custom:CeCILL')
depends=(
  'curl'
  'fftw'
  'gcc-libs'
  'glibc'
  'graphicsmagick'
  'libjpeg'
  'libpng'
  'libtiff'
  'libx11'
  'openexr'
  'zlib'
)
makedepends=(
  'cmake'
  'qt5-base'
  'qt5-tools'
)
optdepends=('qt5-base: for the Qt UI')
provides=("${_basename}=${pkgver}")
conflicts=("${_basename}" 'cimg')
_tarname="${_basename}_${pkgver}"
_tardirname="${_tarname/_/-}"
source=("${url}files/source/${_tarname}.tar.gz"
        'CMakeLists.txt'
        'FindCImg.cmake'
        'FindGMicStdlib.cmake'
        'FindGraphicsMagick.cmake'
)
sha256sums=('25d1583932801321fe559ee87c3c19c60d45f9119447d86049f073ad295b3da3'
            '089c4ad204a1ed43c9425e3f39e5a3a8bab3d6e8c4fb5a6dfc69e0fca15abd15'
            '5ad1b499cb0a9e3d9fff6a851346d6f356dfc592442183d6330726a29ee25384'
            '83e4635a6fd101511381bc865255f4de88834da51911ce3eb45ddac2558cabcc'
            '9240da9240a0c9c76ac4b503d53f4aec54af544cef3d9cc1f7ad7994d1cda0f9')

prepare() {
  mv 'CMakeLists.txt' "${_tardirname}"
  mkdir -p "${_tardirname}/cmake"
  mv 'FindCImg.cmake' 'FindGMicStdlib.cmake' 'FindGraphicsMagick.cmake' "${_tardirname}/cmake"

  printf 'Checking if ccache is enabled for makepkg... '

  if check_buildoption "ccache" "y"; then
    printf 'yes\n'
    printf 'Enabling C ccache for CMake...\n'
    export CMAKE_C_COMPILER_LAUNCHER='ccache'
    printf 'Enabling C++ ccache for CMake...\n'
    export CMAKE_CXX_COMPILER_LAUNCHER='ccache'
  else
    printf 'no\n'
  fi

  printf 'Configuring to use CPPFLAGS in CMake...\n\n'
  export CFLAGS+=" ${CPPFLAGS}" # CMake ignores CPPFLAGS
  export CXXFLAGS+=" ${CPPFLAGS}" # CMake ignores CPPFLAGS

  printf 'Configuring gmic build with CMake...\n\n'
  # CMake also ignores system LDFLAGS if not passed to special LINKER_FLAGS_INIT
  cmake -B 'build' -S "${_tardirname}" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_EXE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_MODULE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DBUILD_LIB_STATIC='OFF' \
    -DENABLE_DYNAMIC_LINKING='ON' \
    -DENABLE_OPENCV='OFF'

  printf 'Configuring gmic-qt build with CMake...\n\n'
  # CMake also ignores system LDFLAGS if not passed to special LINKER_FLAGS_INIT
  LDFLAGS="${LDFLAGS} -L../build"
  cmake -B 'build-qt' -S "${_tardirname}/gmic-qt" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_EXE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_MODULE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DENABLE_DYNAMIC_LINKING='ON' \
    -DGMIC_PATH="${srcdir}/${_tardirname}/src" \
    -DGMIC_QT_HOST='none'
}

build() {
  printf 'Building gmic with CMake...\n\n'
  cmake --build 'build'
  printf 'Building gmic-qt with CMake...\n\n'
  cmake --build 'build-qt'
}

package() {
  DESTDIR="${pkgdir}" cmake --install 'build'
  install -Dm 644 "${_tardirname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  DESTDIR="${pkgdir}" cmake --install 'build-qt'

  install -Dm 644 "${_tardirname}/resources/gmic_cluts.gmz" -t "${pkgdir}/usr/share/${_basename}"
}
