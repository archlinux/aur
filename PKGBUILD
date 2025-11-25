# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: roberto <roberto@archlinux.org>

_pkgname=transcode
pkgname="${_pkgname}"
pkgver=1.1.7
pkgrel=47
pkgdesc='A video/DVD ripper and encoder for the terminal/console'
arch=(x86_64)
url="https://sources.archlinux.org/other/packages/${pkgname}"
license=('GPL-2.0-only')
depends=(
  a52dec
  gawk
  glibc
  libasound.so      # Provided by 'alsa-lib'.
  libdvdread
  libdv
  libfaac.so
  libfreetype.so    # Provided by 'freetype2'.
  libjpeg.so        # Provided by 'libjpeg' or 'libjpeg-turbo'.
  libmp3lame.so
  libmpeg2
  libogg.so         # Provided by 'libogg'.
  libquicktime
  libtheora
  libvorbis.so      # Provided by 'libvorbis'.
  libx11
  libx264.so
  libxaw
  libxext
  libxml2.so        # Provided by 'libxml2'.
  libxt
  libxv
  libxvidcore.so    # Provided by 'xvidcore'.
  liblzo2.so        # Provided by 'lzo'.
  mjpegtools
  sdl                # Provided by 'sdl12-compat'

  #libavcodec.so=58   # Provided by 'ffmpeg4.4'.
  #libavformat.so=58  # Provided by 'ffmpeg4.4'.
  #libpostproc.so=55  # Provided by 'ffmpeg4.4'.
)
makedepends=(
  autoconf
  make
  patch

  alsa-lib
  faac
  ffmpeg4.4  # Needed for 'libavcodec', 'libavformat', 'libpostproc' dependencies.
  freetype2
  lame
  libjpeg    # Provided also by 'libjpeg-turbo'.
  libogg
  libvorbis
  libxml2
  lzo
  nasm
  x264
  xvidcore
)
source=(
  https://sources.archlinux.org/other/packages/${pkgname}/${pkgname}-${pkgver}.tar.bz2
  transcode-imagemagick7.patch
  transcode-gcc10.patch
  transcode-glibc-2.32.patch
)
b2sums=(
  '25001d4cae83d86e5295917bcd9e2e77dd61637e238394a2d603398baf810201dc61d8b0de5b54a7b8848ac3bcef5fb211e8f2b43ed7da4e56e335b8d4d2fbe1'
  'fdf66bd56e8e87d029a27a057815be571e605e50c817b84a0a57c9696d69a5dc61421028f5526f6bf19ecab61c58811920e45ae2c59d4fc1ee6fb3f42950d43b'
  'c564b28e99ef397694243e9411e10feec4fe9c1b5efb8f6ea4c76621a61116a6c0d643a3c21a9544960763e9ff68221e747be1b66598f31bf638edaf585131cd'
  'cab8a1e553161ddf2e9ecd43e0307aa8cb0fdf9bf43a2df61a18404450eca47eaf9ff24c2bd9a3c73a5d92d63c19bb82d0be2263bee94ffca78ed1e9a96b6bb2'
)

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/transcode-imagemagick7.patch # Gentoo patch
  sed -e 's|freetype/ftglyph.h|freetype2/freetype/ftglyph.h|' -i filter/subtitler/load_font.c
  patch -p1 -i "${srcdir}"/transcode-gcc10.patch # Fix build with GCC 10
  patch -p1 -i "${srcdir}"/transcode-glibc-2.32.patch # Fix build with glibc 2.32
  sed -e 's|#define _ISOC99_SOURCE||' -i libtc/cfgfile.c
  autoreconf -vi
}

build() {
  cd ${pkgname}-${pkgver}

  CFLAGS+=" -std=gnu11" # Needed for newer GCC versions.
  CFLAGS+=" -Wno-implicit-function-declaration -Wno-error=implicit-function-declaration" # Otherwise, leads to compile errors when using 'lame'.
  export CFLAGS

  ## Prefer ffmpeg4.4 libraries in beeing found -- needed for libavcodec, libavformat, libpostproc:
  local _ffmpeg44_pkgconfpath
  _ffmpeg44_pkgconfpath="/usr/lib/ffmpeg4.4/pkgconfig"
  if [ -n "${PKG_CONFIG_PATH}" ]; then
   PKG_CONFIG_PATH+=":${_ffmpeg44_pkgconfpath}"
  else
   PKG_CONFIG_PATH="${_ffmpeg44_pkgconfpath}"
  fi
  export PKG_CONFIG_PATH

  # libv4l, ffmpeg and imagemagick are disabled, because up to date versions no longer work or are no longer recognised.
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --enable-altivec \
    --disable-ffmpeg \
    --enable-libavcodec \
    --enable-libavformat \
    --disable-libv4l2 \
    --enable-libv4lconvert \
    --enable-libmpeg2 \
    --enable-libmpeg2convert \
    --enable-experimental \
    --enable-deprecated \
    --enable-statbuffer \
    --enable-v4l \
    --disable-bktr \
    --disable-sunau \
    --enable-oss \
    --enable-alsa \
    --enable-libpostproc \
    --enable-freetype2 \
    --enable-lame \
    --enable-xvid \
    --enable-x264 \
    --enable-ogg \
    --enable-vorbis \
    --enable-theora \
    --enable-libdvdread \
    --disable-pvm3 \
    --enable-libdv \
    --enable-libquicktime \
    --enable-lzo \
    --enable-a52 \
    --enable-faac \
    --enable-libxml2 \
    --disable-ibp \
    --enable-mjpegtools \
    --enable-sdl \
    --disable-imagemagick \
    --disable-libjpegmmx \
    --enable-libjpeg \
    --disable-bsdav \
    --enable-iconv \
    --disable-pv3 \
    --enable-nuv \
    --enable-x86-textrels \
    --disable-warnings-as-errors \
    --enable-year2038 \
    --with-x

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      AUTHORS ChangeLog INSTALL README STYLE TODO
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
