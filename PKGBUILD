# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributors: jdc, rayman2200, TheCycoONE

pkgname='corsix-th'
_projectname='CorsixTH'
# TODO: fix versioning: from 0.67, format should be (in increasing order): 0.67beta1, 0.67rc, 0.67
pkgver=0.66_release
_tagver=0.66
pkgrel=1
pkgdesc='Reimplementation of the game engine of Theme Hospital'
url='https://corsixth.com/'
_repourl="https://github.com/${_projectname}/${_projectname}"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=(
  'ffmpeg'
  'freetype2'
  'hicolor-icon-theme'
  'lua'
  'lua-filesystem'
  'lua-lpeg'
  'sdl2_mixer'
)
makedepends=(
  'catch2'
  'cmake'
  'ninja'
  'doxygen'
)
checkdepends=(
  'busted'
  'luacheck'
)
optdepends=(
  'freepats-legacy: Soundfont for Midi playback'
  'soundfont-fluid: Alternative soundfont for Midi playback'
)
install="${pkgname}.install"
_tarname="${_projectname}-${_tagver}"
source=("${_tarname}.tar.gz::${_repourl}/archive/refs/tags/v${_tagver}.tar.gz")
b2sums=('7bceb0d5893849ba906ccd9516ecd52f0a1c54f3a91bff932c0db053f66e71a3d38dfdb55979cb9bb2047c7338b3badbb32defa216a9867fb7166f4ca14bfa75')

prepare() {
  printf 'Checking if ccache is enabled... '

  if ! check_buildoption "ccache" "y"; then
    echo 'no'
  else
    echo 'yes'

    echo '-- Enabling ccache for the C++ compiler in CMake'
    export CMAKE_CXX_COMPILER_LAUNCHER='ccache'
  fi

  echo 'Configuring external build flags for CMake...'
  echo '-- Adding CPPFLAGS to CFLAGS and CXXFLAGS; otherwise it might be ignored by CMake'
  export CXXFLAGS+=" ${CPPFLAGS}"

  echo
  echo "Configuring ${_projectname} CMake build..."

  echo '-- Adding LDFLAGS to LINKER_FLAGS_INIT vars, otherwise it might be ignored by CMake'

  cmake -S "${_tarname}" \
        -B 'build' \
        -G 'Ninja' \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="${LDFLAGS}" \
        -DENABLE_UNIT_TESTS='ON'
}

build() {
  echo "Building ${_projectname} with CMake..."
  cmake --build 'build'
}

check() {
  cd "${srcdir}/${_tarname}"

  echo "--> Executing luacheck... "
  luacheck --codes --ranges "${_projectname}"
  echo

  echo "--> Executing busted..."
  busted \
    --verbose \
    --directory="${_projectname}/Luatest" \
    --filter-out="Calculate simple VIP rating"
  echo

  cd "${srcdir}/build/${_projectname}"

  echo "--> Executing CMake ctest..."
  ctest --extra-verbose --build-config Release --output-on-failure
}

package() {
  echo "Installing ${_projectname} with CMake..."
  DESTDIR="${pkgdir}/" cmake --install 'build'

  # license
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
