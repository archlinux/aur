# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Reiser <metal@pop3.ru>
# Contributor: Andrew Panchenko <panchenkoac at gmail>

pkgname=qmmp-svn
pkgver=2.1.6.svn.r11196
pkgrel=1
pkgdesc="A Qt based audio-player. (SVN Version)"
arch=('x86_64')
url='http://qmmp.ylsoftware.com'
license=('GPL')
depends=(
  'gcc-libs' # 'libgcc_s.so' 'libstdc++.so'
  'glibc' # 'libc.so' 'libm.so'
  'libglvnd' 'libGL.so'
  'libx11' # 'libX11.so'
  'curl' 'libcurl.so'
  'hicolor-icon-theme'
  'qt6-base' # 'libQt6Core.so' 'libQt6DBus.so' 'libQt6Gui.so' 'libQt6Network.so' 'libQt6OpenGLWidgets.so' 'libQt6Sql.so' 'libQt6Widgets.so'
  'taglib' # 'libtag.so'
  'bash'
)
makedepends=(
  'subversion'
  'cmake'
  'flac'
  'jack'
  'libmpcdec'
  'libpulse'
  'ffmpeg'
  'libcdio-paranoia'
  'libcdio'
  'libcddb'
  'enca'
  'wildmidi'
  'libgme'
  'libmad'
  'libvorbis'
  'libogg'
  'libmms'
  'libsamplerate'
  'libmodplug'
  'libsndfile'
  'wavpack'
  'projectm'
  'mesa'
  'libsidplayfp'
  'opusfile'
  'faad2'
  'libbs2b'
  'taglib'
  'alsa-lib'
  'qt6-multimedia'
  'qt6-tools'
  'libarchive'
  'libshout'
  'mpg123'
  'librcd'
  'libxmp'
  'libpipewire'
  'libsoxr'
)
optdepends=(
  'qmmp-plugin-pack-svn: for mpg123, ffap and qtui plugin'
  'flac: native FLAC support'
  'jack: JACK sound output'
  'libmpcdec: Musepack support'
  'alsa-lib: ALSA output suppport'
  'libpulse: PulseAudio output support'
  'libcdio-paranoia: Compact Disc input and control support'
  'libcddb: CDDB server support'
  'libmms: MMS stream protocol support'
  'libmodplug: MOD playing library support'
  'libsndfile: sampled sound support'
  'projectm: visual efects support'
  'ffmpeg: FFmpeg engine (include lot of audio formats) support'
  'librcd: Used by FFmpeg plugin'
  'mplayer: Mplayer engine (include lot of audio formats) support'
  'libsamplerate: audio filter support'
  'libbs2b: audio filter support'
  'wavpack: WavPack audio support'
  'libsidplayfp: SID audio support'
  'opusfile: OPUS audio support'
  'enca: CUEsheet audio and text encoding support'
  'wildmidi: native MIDI audio support'
  'faad2: native AAC audio support'
  'libgme: video game music format suppoort'
  'libmad: MPEG audio decoder support'
  'libvorbis: Vorbis audio support'
  'libogg: OGG audio support'
  'qt6-multimedia: Qt media output support'
  'libarchive: libarchive input support'
  'libshout: shoutcast/icecast input support'
  'mpg123: alternative Mpeg-1-2-3 support'
  'libxmp: XMP input support'
  'libpipewire: Pipewire output support'
)
provides=(
  "qmmp=${pkgver}"
  'libqmmp.so' 'libqmmpui.so'
)
conflicts=('qmmp')
source=(
  'qmmp::svn+http://svn.code.sf.net/p/qmmp-dev/code/branches/qmmp-2.1/'
  'pkgconfig_fix.diff'
)
sha256sums=(
  'SKIP'
  'cdc27a35edd99635fdcc912c987479fd2fb4265b8ef55f908307afb5d6ae2978'
)
options=('debug')

pkgver() {
  cd qmmp
  echo "$(cat qmmp.pri | grep -m1 QMMP_VERSION | cut -d ' ' -f3).svn.r$(svnversion | tr -d M | tr : .)"
}

prepare() {
  patch -d qmmp -p0 -i "${srcdir}/pkgconfig_fix.diff"
}

build() {
  cmake -S qmmp -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_LIBRCD=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
