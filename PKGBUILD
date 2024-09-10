# Maintainer: Ong Yong Xin <ongyongxin2020+github@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=audacity-git
pkgver=3.6.3.r257.g652bfea82
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('i686' 'x86_64')
url="https://www.audacityteam.org/"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=(
  alsa-lib
  expat
  ffmpeg
  flac
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gtk3
  gtkmm3
  jack
  lame
  libid3tag
  libmad
  libogg
  libsbsms
  libsndfile
  libsoxr
  libvorbis
  libxkbcommon-x11
  lilv
  lv2
  mpg123
  opusfile
  portaudio
  portmidi
  portsmf
  rapidjson
  soundtouch
  serd
  sord
  sratom
  sqlite
  suil
  twolame
  vamp-plugin-sdk
  vst3sdk
  wavpack
  wxwidgets-gtk3
  xcb-util
  xcb-util-cursor
  xcb-util-keysyms
  zlib
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
source=("git+https://github.com/audacity/audacity.git")
sha256sums=('SKIP')

pkgver() {
  cd audacity
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f2-
}

build() {
  export CC=gcc
  export VST3_SDK_DIR=/usr/src/vst3sdk

  local cmake_args=(
    -B build
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D audacity_conan_enabled=OFF
    -D audacity_has_networking=OFF
    -D audacity_has_crashreports=OFF
    -D audacity_has_updates_check=OFF
    -D audacity_has_sentry_reporting=OFF
    -D audacity_lib_preference=system
    -D audacity_obey_system_dependencies=ON
    -S audacity
  )

  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
