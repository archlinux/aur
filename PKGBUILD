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
  echo "Adding back CMake build system files (removed from upstream)"

  mv --verbose 'CMakeLists.txt' "${_tardirname}"
  mkdir --verbose --parents "${_tardirname}/cmake"
  mv --verbose 'FindCImg.cmake' 'FindGMicStdlib.cmake' 'FindGraphicsMagick.cmake' "${_tardirname}/cmake"

  printf 'Checking if ccache is enabled... '

  if check_buildoption "ccache" "n"; then
    echo 'no'
  else
    echo 'yes'

    echo '-- Enabling ccache for the C compiler in CMake'
    export CMAKE_C_COMPILER_LAUNCHER='ccache'
    echo '-- Enabling ccache for the C++ compiler in CMake'
    export CMAKE_CXX_COMPILER_LAUNCHER='ccache'
  fi

  echo 'Configuring external build flags for CMake...'
  echo '-- Adding CPPFLAGS to CFLAGS and CXXFLAGS; otherwise it might be ignored by CMake'
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"

  echo
  echo "Configuring ${_basename} CMake build..."

  echo '-- Adding LDFLAGS to LINKER_FLAGS_INIT vars, otherwise it might be ignored by CMake'

  cmake -B 'build' \
        -S "${_tardirname}" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DBUILD_LIB_STATIC='OFF' \
        -DENABLE_DYNAMIC_LINKING='ON' \
        -DENABLE_OPENCV='OFF'

  echo
  echo "Configuring ${_basename}-qt CMake build..."

  echo "-- Adding ${_basename} build dir to LDFLAGS: ${srcdir}/${_tardirname}/build"
  LDFLAGS="${LDFLAGS} -L'${srcdir}/${_tardirname}/build'"

  echo '-- Adding LDFLAGS to LINKER_FLAGS_INIT vars, otherwise it might be ignored by CMake'

  cmake -B 'build-qt' \
        -S "${_tardirname}/gmic-qt" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DENABLE_DYNAMIC_LINKING='ON' \
        -DGMIC_PATH="${srcdir}/${_tardirname}/src" \
        -DGMIC_QT_HOST='none'
}

build() {
  echo "Building ${_basename} with CMake..."
  cmake --build 'build'
  echo
  echo "Building ${_basename}-qt with CMake..."
  cmake --build 'build-qt'
}

package() {
  DESTDIR="${pkgdir}" cmake --install 'build'
  install -Dm 644 "${_tardirname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  DESTDIR="${pkgdir}" cmake --install 'build-qt'

  install -Dm 644 "${_tardirname}/resources/gmic_cluts.gmz" -t "${pkgdir}/usr/share/${_basename}"
}
