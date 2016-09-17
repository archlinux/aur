# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
# Contributor: Vladimir Protasov <eoranged AT ya.ru>

_pkgbase='moc-pulse'
pkgname="${_pkgbase}-git"
pkgver=2.6_alpha2.r2313
pkgrel=1
pkgdesc='An ncurses console audio player with support for pulseaudio (using latest upstream sources)'
arch=('i686' 'x86_64')
url="http://moc.daper.net/"
license=('GPL')
depends=('libmad' 'libid3tag' 'jack' 'curl' 'libltdl' 'file' 'pulseaudio')
makedepends=('git' 'speex' 'ffmpeg' 'taglib' 'libmpcdec' 'wavpack' 'libmodplug' 'faad2')
optdepends=('speex: for using the speex plugin'
          'ffmpeg: for using the ffmpeg plugin'
          'taglib: for using the musepack plugin'
          'libmpcdec: for using the musepack plugin'
          'wavpack: for using the wavpack plugin'
          'faad2: for using the aac plugin'
          'libmodplug: for using the modplug plugin')
provides=('moc')
conflicts=('moc')
source=("${_pkgbase}::git+https://git.hans.ninja/git/hans/moc-pulse.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "%s.r%s" "$(awk -F',' '/AC_INIT/{ gsub(/[\[\]]/,""); gsub(/-/, "_"); print $2 }' configure.in)" "$(git rev-list --count HEAD)"
}

prepare() {
  cd "${_pkgbase}"

  msg2 "Creatinge ./configure script and Makefile"
  autoreconf --force -i
}

build() {
  cd "${_pkgbase}"
  
  msg2 "Begin configuring"
  ./configure --prefix=/usr --without-rcc \
    --with-pulse --with-oss --with-alsa --with-jack --with-aac \
    --with-mp3 --with-musepack --with-vorbis --with-flac \
    --with-wavpack --with-sndfile --with-modplug --with-ffmpeg \
    --with-speex --with-samplerate --with-curl  --disable-cache \
    --disable-debug
  make
}

package() {
  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2
