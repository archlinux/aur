# Maintainer: Evert Vorster <superchief@evertvorster.com>
# Contributor:  Ong Yong Xin <ongyongxin2020+github@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=audacity-git
_pkgname=audacity
pkgver=3.6.4.r1832.gcb75634dcc
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('i686' 'x86_64')
url="https://www.audacityteam.org/"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=(
  'libxtst'
  'perl'
  'qt6-networkauth'
  'qt6-5compat'
  'qt6-svg'
  'qt6-base'
  'qt6-declarative'
)
makedepends=('cmake' 'gcc' 'git' 'nasm')
optdepends=('ffmpeg: additional import/export capabilities')
provides=(
  'audacity'
  'ladspa-host'
  'lv2-host'
  'vamp-host'
  'vst-host'
  'vst3-host'
)
conflicts=('audacity')
source=(
  "git+https://github.com/audacity/audacity.git"
  "git+https://github.com/musescore/framework_tmp.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd ${srcdir}/${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f2-
}

prepare(){
  cd "${srcdir}/${_pkgname}"
  echo "Initialize Submodules"
  git submodule init
  echo "Updating git submodule paths"
#  git config submodule.src/external/glaxnimate.url "$srcdir/glaxnimate"

 echo "Updating git submodules"
 git -c protocol.file.allow=always submodule update
}


build() {
#  export CC=gcc
#  export VST3_SDK_DIR=/usr/src/vst3sdk
  echo "Build Step"

  local cmake_args=(
    -B build/
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_C_FLAGS="-D_GNU_SOURCE"
    -S .
  )

#    -D audacity_conan_enabled=OFF
#    -D audacity_has_networking=OFF
#    -D audacity_has_crashreports=OFF
#    -D audacity_has_updates_check=OFF
#    -D audacity_has_sentry_reporting=OFF
#    -D audacity_lib_preference=system
#    -D audacity_obey_system_dependencies=ON



  cd ${srcdir}/${_pkgname}
  cmake "${cmake_args[@]}"
  cmake --build build/
}

package() {
  cd ${srcdir}/${_pkgname}
  DESTDIR="${pkgdir}" cmake --install build/
}
