# Maintainer: Guatavo Alvarez <sl1pkn07@gmail.com>

pkgname=audiotools-git
pkgver=3.1.1.129.gde55488d
pkgrel=1
pkgdesc="Collection of audio handling programs which work from the command line (GIT Version)"
arch=('x86_64')
url='http://audiotools.sourceforge.net'
license=('GPL')
depends=(
  'glibc' # libm.so
  'alsa-lib' 'libasound.so'
  'python'
  'python-urwid'
  'python-pillow'
  'libcdio' # libcdio.so
  'libcdio-paranoia' # libcdio_cdda.so libcdio_paranoia.so
  'libpulse' 'libpulse.so'
  'opus' 'libopus.so'
  'opusfile' # libopusfile.so
  'twolame' 'libtwolame.so'
  'mpg123' 'libmpg123.so'
  'lame' 'libmp3lame.so'
  'wavpack' # libwavpack.so
  'libvorbis' 'libvorbisenc.so' 'libvorbisfile.so'
  'libdvd-audio-git' # libdvd-audio.so
)
makedepends=(
  'git'
  'python-setuptools'
  'python-installer'
  'python-wheel'
  'python-build'
)
optdepends=(
  'faad2: Decoding AAC'
  'faac: Encoding AAC'
  'neroaacdec: Decoding AAC (preferred)'
  'neroaacenc: Encoding AAC (preferred)'
  'mp3gain: For MP3 Replay Gain support'
  'vorbisgain: For OGG Replay Gain support'
  'cdrkit: for CD burning without cuesheets'
  'cdrtools: for CD burning without cuesheets'
  'cdrdao: for CD burning with cuesheets'
)
conflicts=('audiotools')
provides=('audiotools')
source=(
  'audiotools::git+https://github.com/tuffy/python-audio-tools.git'
  'https://github.com/tuffy/python-audio-tools/pull/82.diff'
)
sha256sums=(
  'SKIP'
  'a6093fec3495e3fffa12d173e4c8bc533000fcf3f05558159881b8e79e1b4452'
)
options=('debug')

pkgver() {
  cd audiotools
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd audiotools

  # fix urwid error
  patch -p1 -i "${srcdir}/82.diff"

  sed -e 's|-m 644|-Dm 644|g' \
      -i Makefile \
      -i docs/Makefile
}

build() {
  cd audiotools
  CFLAGS+=' -Wno-implicit-function-declaration'

  python -m build --wheel --no-isolation
  make -C docs
}

package() {
  cd audiotools
  python -m installer --destdir="${pkgdir}" dist/*.whl
  make -C docs install MAN_PATH="${pkgdir}/usr/share/man"
  rm -fr "${pkgdir}/usr/share/man/man1/audiotools.cfg.5.gz"
}
