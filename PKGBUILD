# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: roberto <roberto@archlinux.org>

_pkgname=transcode
pkgname="${_pkgname}"
pkgver=1.1.7
pkgrel=51
pkgdesc='A video/DVD ripper and encoder for the terminal/console'
arch=(
  'x86_64'
  'i686'
  'aarch64'
)
url="https://sources.archlinux.org/other/packages/${pkgname}"
license=('GPL-2.0-only')
depends=(
  a52dec
  gawk
  glibc
  libasound.so      # Provided by 'alsa-lib'.
  libdvdread
  libdv
  libfaac.so        # Provided by 'faac'.
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
  libjpeg-turbo
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
  transcode-imagemagick7.patch     # Gentoo patch
  transcode-subtitler-fix-freetype-includepath.patch  # Fix freetype include path in 'filter/subtitler/load_font.c': '#include <freetype/ftglyph.h>' -> '#include <freetype2/freetype/ftglyph.h>'.
  transcode-gcc10.patch            # Fix build with GCC 10
  transcode-glibc-2.32.patch       # Fix build with glibc 2.32
  transcode-libtc-cfgfile.c-remove-ISOC99_SOURCE.patch  # Remove in 'libtc/cfgfile.c': '#define _ISOC99_SOURCE  /* needed by glibc to declare strtof() */'
  transcode-configure-lame4.patch  # Fix detection of LAME >= 4.0, see https://aur.archlinux.org/packages/transcode#comment-1080395
)
b2sums=(
  '25001d4cae83d86e5295917bcd9e2e77dd61637e238394a2d603398baf810201dc61d8b0de5b54a7b8848ac3bcef5fb211e8f2b43ed7da4e56e335b8d4d2fbe1'  # ${pkgname}-${pkgver}.tar.bz2
  'fdf66bd56e8e87d029a27a057815be571e605e50c817b84a0a57c9696d69a5dc61421028f5526f6bf19ecab61c58811920e45ae2c59d4fc1ee6fb3f42950d43b'  # transcode-imagemagick7.patch
  '07fce83a2fa2318d29dd79592fa3fc7be826f24a035192b2845dc081c8b413faabb5d378e6f913a1a5abc42dfc052575b24938e4bc5d61c6a95c3310bf567768'  # transcode-subtitler-fix-freetype-includepath.patch
  'c564b28e99ef397694243e9411e10feec4fe9c1b5efb8f6ea4c76621a61116a6c0d643a3c21a9544960763e9ff68221e747be1b66598f31bf638edaf585131cd'  # transcode-gcc10.patch
  'cab8a1e553161ddf2e9ecd43e0307aa8cb0fdf9bf43a2df61a18404450eca47eaf9ff24c2bd9a3c73a5d92d63c19bb82d0be2263bee94ffca78ed1e9a96b6bb2'  # transcode-glibc-2.32.patch
  '87e910591a04a013a05b7880133163948c7d62490fb5286cc5a54a1993525ba3f02d8c7de6c28b0ac89d2d9498963ec28efde9b3a24f062e31596a6da9114ebb'  # transcode-libtc-cfgfile.c-remove-ISOC99_SOURCE.patch
  '23e1fc089fb945c9085f4def18f7bf0235bcc78ab8277be9484e401ad7555cf02118108f3df0febbd2f15db0dade9e72e58620982be51a0be09a6fe9b8434854'  # transcode-configure-lame4.patch
)

prepare() {
  cd ${pkgname}-${pkgver}

  for _patch in "${srcdir}"/transcode-{imagemagick7,transcode-subtitler-fix-freetype-includepath,gcc10,glibc-2.32,transcode-libtc-cfgfile.c-remove-ISOC99_SOURCE.patch,configure-lame4}.patch ; do
    printf '%s\n' "Applying patch '$(basename "${_patch}" ...)'"
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  autoreconf -vi
}

build() {
  cd ${pkgname}-${pkgver}

  CFLAGS+=" -std=gnu11" # Needed for newer GCC versions.
  CFLAGS+=" -Wno-implicit-function-declaration -Wno-error=implicit-function-declaration -Wno-strict-prototypes -Wno-unused-but-set-variable -Wno-enum-int-mismatch -Wno-pointer-sign -Wno-unused-result" # Otherwise, leads to compile errors when using 'lame'. Also, we silence some other warnings.
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
