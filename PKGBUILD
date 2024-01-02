# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: yustin <#archlinux-proaudio@libera.chat>
# Contributor: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: xantares

pkgname=stargate
pkgver=24.01.1
pkgrel=1
pkgdesc="Innovation-first digital audio workstation (DAW), instrument and effect plugins, wave editor"
license=(GPL)
arch=(
  x86_64
  aarch64
)
url="https://github.com/stargatedaw/stargate"
depends=(
  alsa-lib
  fftw
  gcc-libs
  glibc
  libsndfile
  portaudio
  portmidi
  python
  python-jinja
  python-mido
  python-numpy
  python-psutil
  python-pymarshal
  python-pyqt6
  python-rtmidi
  python-wavefile
  python-yaml
  rubberband
)
makedepends=(
  git
  jq
  libsbsms
)
optdepends=(
  'ffmpeg'
  'lame'
  'vorbis-tools'
)

_commit=835ef6f081a5d72035e1c9767eaaf74e59783df0 # git rev-parse "$pkgver"
source=(
  "git+$url.git#commit=$_commit"
  "git+https://github.com/spatialaudio/portaudio-binaries.git"
  "git+https://github.com/stargatedaw/stargate-soundtouch.git"
  "git+https://github.com/stargatedaw/stargate-sbsms.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

_archive="$pkgname"

pkgver() {
  cd "$_archive"

  git describe --tags | sed 's/release-//'
}

prepare() {
  cd "$_archive"

  git submodule init
  git config submodule.src/vendor/portaudio-binaries.url "$srcdir/portaudio-binaries"
  git config submodule.src/vendor/soundtouch.url "$srcdir/stargate-soundtouch"
  git config submodule.src/vendor/sbsms.url "$srcdir/stargate-sbsms"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$_archive/src"

  # for non-x86 architectures
  PLAT_FLAGS="$CFLAGS" make all
}

package() {
  cd "$_archive/src"

  DESTDIR=$pkgdir make install
}
