# Contributor: Bitts311 <oceanmail311@gmail.com>

##Select your language - all bg cs da de el en es fr hu it ja ko mk nb nl pl ro ru sk sv tr uk pt_BR zh_CN zh_TW

pkgname=mplayer-gui-svn
pkgver=38214M
pkgrel=1
pkgdesc='Media player for Linux - SVN version'
url='http://www.mplayerhq.hu/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'ttf-font' 'enca' 'libxss' 'a52dec' 'libvpx' 'lirc' 'x264' 'libmng' 'libdca' 'aalib' 'libxinerama' 'smbclient' 'jack2' 'libmad' 'libcaca' 'libxxf86vm' 'faac' 'faad2' 'libxv' 'libxvmc' 'mpg123' 'libx11' 'libcdio' 'libcdio-paranoia' 'rtmpdump' 'libdvdread' 'libdvdnav' 'ffmpeg' 'libbs2b' 'alsa-lib' 'giflib' 'glibc' 'libass' 'zlib' 'libjpeg' 'libpng' 'libpulse' 'libogg' 'fribidi' 'libtheora' 'libvorbis' 'libbluray' 'xvidcore' 'ncurses' 'fontconfig' 'freetype2' 'libxext' 'libvdpau' 'libgl' 'openal' 'speex' 'libmpeg2' 'glibc' 'lame' 'subversion' 
)

makedepends=('xorgproto' 'libxxf86vm' 'libmad' 'libxinerama' 'libmng' 'libxss' 'smbclient' 'aalib' 'jack2' 'libcaca' 'faac' 'faad2' 'lirc' 'libxv' 'libxvmc' 'enca' 'libdca' 'a52dec' 'libvpx' 'unzip' 'mesa' 'live-media' 'yasm' 'git' 'mpg123' 'ladspa' 'libcdio' 'zlib' 'libcdio-paranoia' 'x264' 'rtmpdump' 'libdvdcss' 'libdvdread' 'libdvdnav' 'ffmpeg' 'giflib' 'libbs2b' 'fribidi' 'opus' 'libvorbis' 'gsm' 'libpulse' 'alsa-lib' 'glibc' 'libass' 'libjpeg' 'libpng' 'libogg' 'libtheora' 'libbluray' 'xvidcore' 'ncurses' 'fontconfig' 'freetype2' 'libx11' 'libxext' 'libvdpau' 'libgl' 'lame' 'desktop-file-utils' 'ttf-font' 'openal' 'speex' 'libmpeg2'
)

conflicts=('mplayer' 'mencoder')
provides=('mplayer' 'mencoder')
install=mplayer-gui-svn.install
options=('!emptydirs')
source=("mplayer::svn://svn.mplayerhq.hu/mplayer/trunk"
	"https://mplayerhq.hu/MPlayer/skins/Blue-1.13.tar.bz2"
	include-samba-4.0.patch
        revert-icl-fixes.patch
)
sha512sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
  cd "mplayer"
  svnversion
}

prepare() {
  cd "mplayer"

  patch -p1 < "../include-samba-4.0.patch"
  patch -p0 < "../revert-icl-fixes.patch"
  sed -E "s|(#include <samba-4.0/libsmbclient.h>)|#include <time.h>\n\1|g" -i stream/stream_smb.c
  ./version.sh
}


build() {
  cd "mplayer"
  ./configure --prefix=/usr --enable-runtime-cpudetection --enable-gui  --enable-gl --language=all --language-msg=all --enable-smb
  make
}

package() {
  cd "mplayer"
  make DESTDIR="$pkgdir" install
  mv $srcdir/Blue $pkgdir/usr/share/mplayer/skins/default
}

