# Maintainer: Ong Yong Xin <ongyongxin2020+github@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=audacity-git
pkgver=3.3.3.r826.ga3335ea08
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=('i686' 'x86_64')
url="https://www.audacityteam.org/"
license=('GPL2' 'CCPL')
groups=('pro-audio')
depends=(
	'alsa-lib'
	'expat'
	'flac'
	'gtk3'
  'gtkmm3'
	'gst-plugins-bad-libs'
	'jack'
	'lame'
	'libid3tag'
	'libmad'
	'libogg'
	'libsbsms'
	'libsndfile'
	'libsoxr'
	'libvorbis'
	'libx11'
	'lilv'
	'lv2'
	'mpg123'
	'portaudio'
	'portmidi'
	'portsmf'
  'rapidjson'
	'soundtouch'
	'sqlite'
	'suil'
	'twolame'
	'vamp-plugin-sdk'
	'vst3sdk'
	'wavpack'
	'wxwidgets-gtk3'
  'xcb-util-cursor'
	'zlib'
)
makedepends=('cmake' 'gcc' 'git' 'nasm')
optdepends=('ffmpeg: additional import/export capabilities')
provides=('audacity')
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

  cmake_args=(
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D audacity_lib_preference=system
    -D audacity_obey_system_dependencies=On
    -D audacity_conan_enabled=Off
    -D audacity_use_wxwidgets=system
  )

  cmake -S audacity -B build "${cmake_args[@]}"
  cmake --build build
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
