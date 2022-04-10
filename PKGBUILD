# Maintainer: Evert Vorster <evorster@gmail.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=audacity-release-git
pkgver=3.1.3.r0.gff6d6739f
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms <- latest release version in git"
arch=(i686 x86_64)
url="https://www.audacityteam.org/"
license=(GPL2 CCPL)
groups=(pro-audio)
depends=(
  alsa-lib
  expat
  flac
  gtk3
  libid3tag
  libmad
  libogg
  libsndfile
  libsoxr
  libvorbis
  libx11
  lilv
  lv2
  portaudio
  portsmf
  soundtouch
  suil
  twolame
  vamp-plugin-sdk
  zlib
)
makedepends=(
  cmake
  conan
  ffmpeg
  gcc
  git
  gst-plugins-bad-libs
  gstreamer
  jack
  libnotify
  libsoup
  nasm
  sdl2
)
optdepends=('ffmpeg: additional import/export capabilities')
provides=(audacity)
conflicts=(audacity)
source=(
  "git+https://github.com/audacity/audacity.git#branch=release-3.1.3"
)
sha256sums=('SKIP')

pkgver() {
  cd audacity
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f2-
}

build() {
  cd audacity
  mkdir -p build && cd build
  CC=gcc cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxBUILD_TOOLKIT:STRING=gtk3 \
    -Daudacity_use_wxwidgets=local \
    -Daudacity_use_ffmpeg:STRING=loaded \
    -Daudacity_lib_preference=system \
    ..
  cmake --build .
}

package() {
  cd audacity/build
  make DESTDIR="${pkgdir}" install
}
