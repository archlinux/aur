
pkgname=chromium-ffmpeg-codecs
_ffver=7.1.1
pkgver=${_ffver}.m136_119
pkgrel=3
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium-s (non vendored ${_so})"
arch=('x86_64')
url='https://ffmpeg.org/'
license=('GPL2+')
source=(${url}releases/ffmpeg-${_ffver}.tar.xz aom.patch
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/main/0001-Add-av_stream_get_first_dts-for-Chromium.patch
{off,on}-other-ffmpeg.hook)
sha256sums=('733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1'
            '0a4693424f173c4c4d0f1853189d1bd422dcc08f512cc33af3d2acf1e2483e8c'
            'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40'
            '0385dbeb9c6f5485c323a61786fa8e2680a44838cf216582d385231bd1a9bad6'
            'a81395915fd97e3fc0139bd5b8f5fa7f9a0b45209a9b0def067a001b4da274de')
depends=(glibc zlib)
makedepends=(gcc pkgconf diffutils nasm
  patch
  sed
)
optdepends=(electron{34..36}": replace ${_so}")
conflicts=(vivaldi-ffmpeg-codecs opera{,-developer,-beta}-ffmpeg-codecs{,-bin})
provides=("${conflicts[@]}")

prepare() {
  cd ffmpeg-$_ffver
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch
  patch -Np1 -i ../aom.patch
  # Use native opus not in allowed_demuxers
  sed -i '/^ *\.p\.name *=.*/c\.p.name="libopus",' libavcodec/opus/dec.c
}

build() {
  cd ffmpeg-$_ffver
  # See https://github.com/chromium/chromium/blob/main/ and build subset of
  #  allowed_demuxers at media/filters/ffmpeg_glue.cc webm is subset of matroska
  #  kAllowedAudioCodecs and GetAllowedVideoDecoders at media/ffmpeg/ffmpeg_common.cc
  #  Allowed parser?
  # They are kept for long time. So $pkgname should be usable for any Chromiums...

  ./configure \
    --enable-gpl \
    --disable-{all,autodetect,programs,doc,iconv,network} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-protocol=file \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,mp3,aac,h264 \
    --enable-parser=vorbis,flac,mp3,aac,opus,mov \
    --enable-swresample \
    --extra-cflags="$LTOFLAGS" \
    --prefix="${srcdir}"/release \
    --enable-{pic,asm,hardcoded-tables} # https://www.ffmpeg.org/platform.html#toc-Advanced-linking-configuration

  make install

  cd ../release
  gcc $LTOFLAGS -shared $LDFLAGS -Wl,--no-as-needed \
    -Wl,--whole-archive lib/lib{avcodec,avformat}.a \
    -Wl,--no-whole-archive lib/lib{avutil,swresample}.a -Wl,-u,avutil_version \
    -lm $(pkgconf --libs zlib) \
    -Wl,-Bsymbolic \
    -o $_so
}

package(){
  install -Dm644 release/$_so "${pkgdir}"/usr/lib/$_so # system lib
  install -d "${pkgdir}"/opt/vivaldi
  ln -sf /usr/lib/$_so "$pkgdir"/opt/vivaldi/${_so}.7.4
  # Opera has strange LD_PRELOAD
  install -Dm644 {off,on}-other-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
}
