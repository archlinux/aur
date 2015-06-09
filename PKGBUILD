# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
#
# Modified from Arch to remove lirc-utils and smbclient requirements
# Also use latest svn build, with ffmpeg latest snapshot
#

pkgname='mplayer-light-svn'
pkgver=37352
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Media player for Linux (no lirc-utils and smbclient deps)'
makedepends=('sdl' 'libdca' 'mesa' 'yasm' 'svn')
depends=(
    'desktop-file-utils' 'ttf-font' 'enca' 'libxss' 'a52dec' 'libvpx'
    'x264' 'libmng' 'libdca' 'lame' 'fontconfig'
    'libgl' 'libxinerama' 'libvdpau' 'xvidcore'
    'opencore-amr' 'libmad' 'sdl' 'libtheora' 'libxxf86dga'
    'fribidi' 'libjpeg' 'faac' 'faad2' 'libxvmc' 'schroedinger' 'mpg123'
    'libass' 'libxxf86vm' 'libbluray' 'libcdio-paranoia' 'opus'
)
provides=('mplayer')
conflicts=('mplayer')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
license=('GPL')
url='http://www.mplayerhq.hu/'
options=('!buildflags' '!emptydirs' 'strip')
source=(svn://svn.mplayerhq.hu/mplayer/trunk
	http://www.ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
        mplayer.desktop
        cdio-includes.patch)
md5sums=('SKIP'
	 'SKIP'
	 '62f44a58f072b2b1a3c3d3e4976d64b3'
	 '7b5be7191aafbea64218dc4916343bbc'
         )

pkgver() {
  cd trunk
  svnversion
}

prepare() {
  cd trunk
  mv ../ffmpeg .

  patch -p0 -i ../cdio-includes.patch

  echo "#define VERSION \"SVN-r$pkgver\"" > version.h
  echo '#define MP_TITLE "%s "VERSION" (C) 2000-2014 MPlayer Team\n"' >> version.h
}

build() {
  cd trunk

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
    --disable-xvmc \
    --disable-radio \
    --disable-radio-capture \
    --disable-tv \
    --disable-smb \
    --disable-lirc \
    --disable-jack \
    --disable-pulse \
    --disable-caca \
    --disable-inet6 \
    --disable-ladspa \
    --disable-aa \
    --language=en \
    --confdir=/etc/mplayer
  [[ "$CARCH" = "i686" ]] &&  sed 's|-march=i486|-march=i686|g' -i config.mak

  make
}

package() {
  cd trunk
  make DESTDIR="$pkgdir" install-mplayer install-mplayer-man

  install -Dm644 etc/{codecs.conf,input.conf,example.conf} \
    "$pkgdir/etc/mplayer/"

  install -Dm644 ../mplayer.desktop \
    "$pkgdir"/usr/share/applications/mplayer.desktop

  install -Dm644 etc/mplayer256x256.png \
    "$pkgdir"/usr/share/pixmaps/mplayer.png
}
