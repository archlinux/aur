
pkgname=chromium-ffmpeg-codecs-git
pkgver=7.2.r119684.g670089304a
pkgrel=4
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium M138+ (non vendored ${_so})"
arch=('x86_64')
url="https://git.ffmpeg.org/ffmpeg"
license=('GPL-3.0-or-later')

source=('git+https://git.ffmpeg.org/ffmpeg.git'
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/main/0001-Add-av_stream_get_first_dts-for-Chromium.patch
)
sha256sums=('SKIP'
'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40')
depends=(glibc zlib)
makedepends=(gcc pkgconf diffutils nasm git
  patch
  sed
)
optdepends=(chromium-ffmpeg-codecs': for Chromium M136-')
conflicts=(vivaldi-snapshot-ffmpeg-codecs)
provides=("${conflicts[@]}")

prepare() {
  cd ffmpeg
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch
  # Use native opus not in allowed_demuxers
  sed -i '/^ *\.p\.name *=.*/c\.p.name="libopus",' libavcodec/opus/dec.c
}

build() {
  cd ffmpeg
  # See https://github.com/chromium/chromium/blob/main/ Build subset of
  #  allowed_demuxers at media/filters/ffmpeg_glue.cc webm is subset of matroska
  #  kAllowedAudioCodecs and GetAllowedVideoDecoders at media/ffmpeg/ffmpeg_common.cc
  #  Allowed parser?

  ./configure \
    --enable-gpl \
    --disable-{all,autodetect,programs,doc,iconv,network} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-protocol=file \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,pcm_s24le,mp3,aac,h264 \
    --enable-parser=vorbis,flac,mp3,aac,opus,mov \
    --enable-swresample \
    --extra-cflags="${LTOFLAGS}" \
    --prefix="${srcdir}"/release \
    --enable-{pic,asm,hardcoded-tables} # https://www.ffmpeg.org/platform.html#toc-Advanced-linking-configuration
  make install

  cd ../release
  gcc $LTOFLAGS -shared $LDFLAGS -Wl,--no-as-needed  \
    -Wl,--whole-archive lib/lib{avcodec,avformat}.a \
    -Wl,--no-whole-archive lib/lib{avutil,swresample}.a -Wl,-u,avutil_version \
    -lm $(pkgconf --libs zlib) \
    -Wl,-Bsymbolic \
    -o $_so
}

package(){
  install -Dm644 release/$_so "${pkgdir}"/usr/lib/${pkgname}/$_so
  install -d "${pkgdir}"/opt/vivaldi-snapshot
  for n in 7.5 7.6 7.7 7.8 7.9 8.0; do
    ln -svf /usr/lib/${pkgname}/$_so "$pkgdir"/opt/vivaldi-snapshot/${_so}.$n
  done
}
