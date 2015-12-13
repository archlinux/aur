# Maintainer:  Eric Toombs <e double u toombs at uwaterloo dot ca>
# Contributor:  Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgbase='mplayer-svn'
pkgname=('mplayer-svn' 'mencoder-svn')
pkgver=37553
pkgrel=1
_ffmpegver=2.8.2
arch=('i686' 'x86_64')
makedepends=(
  'libxxf86dga' 'libxxf86vm' 'libmad' 'libxinerama' 'sdl' 'lame' 'libtheora'
  'xvidcore' 'libmng' 'libxss' 'libgl' 'aalib' 'jack' 'libcaca'
  'faac' 'faad2' 'lirc'  'libxvmc' 'enca' 'libvdpau' 'opencore-amr'
  'libdca' 'a52dec' 'schroedinger' 'libvpx' 'libpulse' 'fribidi' 'unzip' 'mesa'
  'live-media' 'yasm' 'git' 'fontconfig' 'mpg123' 'ladspa' 'libass' 'libbluray'
  'libcdio-paranoia' 'opus' 'subversion' 'x264' 'libx264' 'rtmpdump' 'gnutls'
  'gsm' 'libdvdcss' 'libdvdread' 'libdvdnav'
)
license=('GPL')
url='http://www.mplayerhq.hu/'
options=('!buildflags' '!emptydirs')
source=("mplayer-$pkgver::svn://svn.mplayerhq.hu/mplayer/trunk#revision=$pkgver"
        "http://ffmpeg.org/releases/ffmpeg-$_ffmpegver.tar.bz2"
        'mplayer.desktop'
        'ffmpeg-libvpxenc-remove-some-unused-ctrl-id-mappings.patch')
md5sums=('SKIP'
         '99f31723326dfe1bfd1bc7521338f2d2'
         '62f44a58f072b2b1a3c3d3e4976d64b3'
         '71be9bcd297cb9ce833bbc5d425c0470')

pkgver() {
  cd "mplayer-$pkgver"
  svnversion
}

prepare() {
  cd "mplayer-$pkgver"
  mv "../ffmpeg-$_ffmpegver" ffmpeg

  patch -d ffmpeg -Np1 <../ffmpeg-libvpxenc-remove-some-unused-ctrl-id-mappings.patch

  ./version.sh
}

build() {
  cd "mplayer-$pkgver"

  ./configure --prefix=/usr \
    --enable-runtime-cpudetection \
    --disable-gui \
    --disable-arts \
    --disable-liblzo \
    --disable-speex \
    --disable-openal \
    --disable-libdv \
    --disable-musepack \
    --disable-esd \
    --disable-mga \
    --disable-ass-internal \
    --disable-cdparanoia \
    --disable-smb \
    --enable-xvmc \
    --enable-radio \
    --enable-radio-capture \
    --language=all \
    --confdir=/etc/mplayer
  [[ "$CARCH" = "i686" ]] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

  make
}

package_mplayer-svn() {
  pkgdesc='Media player for Linux'
  install='mplayer.install'
  backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
  depends=(
    'desktop-file-utils' 'ttf-font' 'enca' 'libxss' 'a52dec' 'libvpx'
    'lirc' 'libx264' 'libmng' 'libdca' 'aalib' 'lame' 'fontconfig'
    'libgl' 'libxinerama' 'libvdpau' 'libpulse' 'xvidcore'
    'opencore-amr' 'jack' 'libmad' 'sdl' 'libtheora' 'libcaca' 'libxxf86dga'
    'fribidi' 'libjpeg' 'faac' 'faad2' 'libxvmc' 'schroedinger' 'mpg123'
    'libass' 'libxxf86vm' 'libbluray' 'libcdio-paranoia' 'opus' 'rtmpdump'
    'gsm' 'gnutls' 'libdvdnav'
  )
  conflicts=('mplayer')
  provides=('mplayer')

  cd "mplayer-$pkgver"
  make DESTDIR="$pkgdir" install-mplayer install-mplayer-man

  install -Dm644 etc/{codecs.conf,input.conf,example.conf} \
    "$pkgdir/etc/mplayer/"

  # desktop file (FS#14770)
  install -Dm644 ../mplayer.desktop \
    "$pkgdir"/usr/share/applications/mplayer.desktop
  install -Dm644 etc/mplayer256x256.png \
    "$pkgdir"/usr/share/pixmaps/mplayer.png
}

package_mencoder-svn() {
  pkgdesc='Free command line video decoding, encoding and filtering tool'
  depends=(
    'enca' 'a52dec' 'libvpx' 'libx264' 'libmng' 'libdca' 'bzip2' 'lame'
    'alsa-lib' 'fontconfig' 'giflib' 'libpng' 'xvidcore'
    'opencore-amr' 'libmad' 'libtheora' 'fribidi' 'libjpeg' 'faac' 'faad2'
    'schroedinger' 'mpg123' 'libass' 'libbluray' 'libcdio-paranoia'
    'libvorbis' 'opus' 'rtmpdump' 'gsm' 'libdvdnav'
  )
  conflicts=('mencoder')
  provides=('mencoder')

  make -C mplayer-$pkgver DESTDIR="$pkgdir" install-mencoder install-mencoder-man
  find "$pkgdir"/usr/share/man -name mplayer.1 -exec rename mplayer.1 mencoder.1 {} +
}
