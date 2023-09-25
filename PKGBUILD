# Maintainer:
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: roberto <roberto@archlinux.org>

pkgname=transcode
_sripver=0.3-4
pkgver=1.1.7
pkgrel=41
pkgdesc='A video/DVD ripper and encoder for the terminal/console'
arch=(x86_64)
url='http://www.transcoding.org/'
license=(GPL)
depends=(gawk imagemagick lzo libdvdread mjpegtools sdl libmpeg2 libxaw a52dec alsa-lib libtheora lame libvorbis)
makedepends=(nasm x264 xvidcore)
#source=(https://bitbucket.org/france/transcode-tcforge/downloads/$pkgname-$pkgver.tar.bz2
source=(https://sources.archlinux.org/other/packages/$pkgname/$pkgname-$pkgver.tar.bz2
        transcode-imagemagick7.patch
        transcode-gcc10.patch
        transcode-glibc-2.32.patch)
sha256sums=('1e4e72d8e0dd62a80b8dd90699f5ca64c9b0cb37a5c9325c184166a9654f0a92'
            '4ede15540ea6932954ac332c12dde130bf48e7e4773d1e04d3c3f23038c6ac51'
            '13ad4d06ca5b98ef66c4e0699d92023727cd7936ef1c4bf7691e3a611c6bb786'
            '8f7aa89be3bc38a42fe664e8f2c0e519158cb4e55b7f99f176f1622c2718b641')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../transcode-imagemagick7.patch # Gentoo patch
  sed -e 's|freetype/ftglyph.h|freetype2/freetype/ftglyph.h|' -i filter/subtitler/load_font.c
  patch -p1 -i ../transcode-gcc10.patch # Fix build with GCC 10
  patch -p1 -i ../transcode-glibc-2.32.patch # Fix build with glibc 2.32
  autoreconf -vi
}


build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --disable-sse --disable-sse2 --disable-altivec --enable-mmx \
    --enable-lame --enable-ogg --enable-vorbis --enable-theora \
    --enable-libdv --enable-libxml2 --enable-v4l \
    --enable-imagemagick --enable-libjpeg --enable-lzo --enable-mjpegtools \
    --enable-sdl --enable-freetype2 --enable-a52 \
    --enable-xvid --enable-x264 --enable-alsa --enable-libmpeg2 \
    --enable-libmpeg2convert --disable-ffmpeg

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
