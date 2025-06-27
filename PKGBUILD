
pkgname=chromium-ffmpeg-codecs-git
pkgver=7.2.r119684.g670089304a
pkgrel=1
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium M138+? (non vendored ${_so})"
arch=('x86_64')
url="https://git.ffmpeg.org/ffmpeg"
license=('GPL-3.0-or-later')

source=('git+https://git.ffmpeg.org/ffmpeg.git'
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/main/0001-Add-av_stream_get_first_dts-for-Chromium.patch
)
sha256sums=('SKIP'
            'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40')
depends=(glibc zlib opus)
makedepends=(gcc pkgconf diffutils nasm git
  patch
)
optdepends=(chromium-ffmpeg-codecs': for old Chromiums')
conflicts=(vivaldi-snapshot-ffmpeg-codecs)
provides=("${conflicts[@]}")

prepare() {
  cd ffmpeg
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch
}

build() {
  cd ffmpeg
  # See https://github.com/chromium/chromium/blob/main/ and build subset of
  #  allowed_demuxers at media/filters/ffmpeg_glue.cc webm is subset of matroska
  #  kAllowedAudioCodecs at media/ffmpeg/ffmpeg_common.cc
  #  GetAllowedVideoDecoders at media/ffmpeg/ffmpeg_common.cc
  #  Allowed parser?
  # They are kept for long time. So $pkgname should be usable for any Chromiums...
  ./configure \
    --enable-gpl \
    --disable-{all,autodetect,programs,doc,iconv,network} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-protocol=file \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,libopus,flac,pcm_s16le,pcm_s24le,mp3,aac,h264 \
    --enable-parser=vorbis,flac,mp3,aac,opus,mov \
    --enable-libopus \
    --extra-cflags="${LTOFLAGS}" \
    --prefix="${srcdir}"/release \
    --enable-{pic,asm,hardcoded-tables} # https://www.ffmpeg.org/platform.html#toc-Advanced-linking-configuration

  make
  make install

  cd ../release
  gcc $LTOFLAGS -shared $LDFLAGS -Wl,--no-as-needed  \
    -Wl,--whole-archive \
      lib/lib{avcodec,avformat,avutil}.a \
    -Wl,--no-whole-archive \
    $(pkgconf --libs zlib opus) \
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
