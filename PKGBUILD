# Mantainer: Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
pkgname=audacity-systemlibs
_pkgname=audacity
pkgver=3.1.3
pkgrel=3
pkgdesc="A program that lets you manipulate digital audio waveforms - GTK 4"
arch=(x86_64)
url="https://www.audacityteam.org/"
license=(GPL2 CCPL)
depends=(
  alsa-lib
  expat
  flac
  gtk3
  jack
  lame
  libid3tag
  libmad
  libogg
  libsbsms
  libsndfile
  libsoxr
  libvorbis
  lilv
  lv2
  portaudio
  portmidi
  portsmf
  python-pycurl
  serd
  sqlite
  sratom
  soundtouch
  sord
  suil
  twolame
  vamp-plugin-sdk
  #wxgtk3 #hoping soon 3.1.5 will be relased, so we can rid off Conan!
)
makedepends=(
  cmake
  conan
  ffmpeg
)
optdepends=('ffmpeg: additional import/export capabilities')
provides=(audacity)
conflicts=(audacity)
source=(
  "https://github.com/$_pkgname/$_pkgname/releases/download/Audacity-$pkgver/$_pkgname-$pkgver-source.tar.gz"
)
sha256sums=('fd8ecdc3d29b3be3bb5cbc01a77806dd59fbec2ad86854924c339811427f2aa1')

build() {
  cd $srcdir/Audacity-$pkgver-Source
  mkdir -p build && cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxBUILD_TOOLKIT:STRING=gtk3 \
    -Daudacity_obey_system_dependencies=On \
    #-Daudacity_use_pch=no \
    -Daudacity_use_ffmpeg:STRING=loaded \
    -Daudacity_lib_preference=system \
    ..
  cmake --build .
}

package() {
  cd $srcdir/Audacity-$pkgver-Source/build
  make DESTDIR="${pkgdir}" install
}
