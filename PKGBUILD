# vim:set ft=sh ts=2 sw=2 et:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Oech3

_browser=vivaldi-snapshot
pkgname=${_browser}-ffmpeg-codecs
pkgver=138.0.7204.55
_vivaldi_major_version=7.5
_commit=dcdd0fa51b65a0b1688ff6b8f0cc81908f09ded2
#_commit=$(curl -sL https://raw.githubusercontent.com/chromium/chromium/refs/tags/${pkgver}/DEPS | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
pkgrel=2
pkgdesc="additional support for proprietary codecs for ${_browser}"
arch=('x86_64')
url='https://chromium.googlesource.com/chromium/third_party/ffmpeg'
license=('GPL-3.0-or-later')
depends=(glibc zlib opus)
makedepends=(gcc pkgconf diffutils nasm git)
source=("chromium-ffmpeg::git+${url}.git#commit=${_commit}")
sha256sums=('8708023dc5aec3ebd5e05677b3f44d7676e287bfc755937bcd6356876e8415e6')

build() {
  cd chromium-ffmpeg
  # See https://github.com/chromium/chromium/blob/${_pkgver} and build subset of
  #  allowed_demuxers at media/filters/ffmpeg_glue.cc webm is subset of matroska
  #  kAllowedAudioCodecs at media/ffmpeg/ffmpeg_common.cc
  #  GetAllowedVideoDecoders at media/ffmpeg/ffmpeg_common.cc
  #  Allowed parser?
  ./configure \
    --enable-gpl \
    --disable-{all,autodetect,programs,doc,iconv,network} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-protocol=file \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,libopus,flac,pcm_s16le,pcm_s24le,mp3,aac,h264 \
    --enable-parser=vorbis,flac,mp3,aac,opus,mov \
    --enable-libopus --extra-cflags=-I/usr/include/opus \
    --extra-cflags="$LTOFLAGS" \
    --prefix="${srcdir}"/release \
    --enable-{pic,asm} # https://www.ffmpeg.org/platform.html#toc-Advanced-linking-configuration

  make
  make install

  cd ../release
  # pthread may static
  gcc $LTOFLAGS -shared $LDFLAGS -Wl,--no-as-needed \
    -Wl,--whole-archive \
      lib/lib{avcodec,avformat,avutil}.a \
    -Wl,--no-whole-archive \
    -lpthread $(pkgconf --libs zlib opus) \
    -Wl,-Bsymbolic \
    -o libffmpeg.so
}

package(){
  install -Dm644 release/libffmpeg.so \
    "$pkgdir/opt/${_browser}/libffmpeg.so.$_vivaldi_major_version"
}
