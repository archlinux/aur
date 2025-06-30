# vim:set ft=sh ts=2 sw=2 et:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Oech3

_browser=vivaldi-snapshot
pkgname=${_browser}-ffmpeg-codecs
pkgver=138.0.7204.55
_vivaldi_major_version=7.5
_commit=dcdd0fa51b65a0b1688ff6b8f0cc81908f09ded2
#_commit=$(curl -sL https://raw.githubusercontent.com/chromium/chromium/refs/tags/${pkgver}/DEPS | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
pkgrel=3
pkgdesc="additional support for proprietary codecs for ${_browser}"
arch=('x86_64')
url='https://chromium.googlesource.com/chromium/third_party/ffmpeg'
license=('LGPL2.1')
depends=(glibc)
makedepends=(gcc diffutils nasm sed git)
source=("chromium-ffmpeg::git+${url}.git#commit=${_commit}")
sha256sums=('8708023dc5aec3ebd5e05677b3f44d7676e287bfc755937bcd6356876e8415e6')

prepare() {
  cd chromium-ffmpeg
  # Use native opus decoder not in kAllowedAudioCodecs at
  # https://github.com/chromium/chromium/blob/${_pkgver}/media/ffmpeg/ffmpeg_common.cc
  sed -i '/^ *\.p\.name *=.*/c\.p.name="libopus",' libavcodec/opus/dec.c
}

build() {
  cd chromium-ffmpeg
  # https://chromium.googlesource.com/chromium/third_party/ffmpeg/+/refs/heads/master/chromium/config/Chrome/linux/x64/
  ./configure \
    --disable-{all,autodetect,programs,doc,iconv,network} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-swresample \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,pcm_s24le,mp3,aac,h264 \
    --enable-parser=aac,flac,h264,mpegaudio,opus,vorbis,vp9 \
    --extra-cflags="$LTOFLAGS" \
    --prefix="${srcdir}"/release \
    --enable-hardcoded-tables \
    --enable-{pic,asm} # https://www.ffmpeg.org/platform.html#toc-Advanced-linking-configuration

  make
  make install

  cd ../release
  gcc $LTOFLAGS -shared $LDFLAGS -Wl,--no-as-needed \
    -Wl,--whole-archive lib/lib{avcodec,avformat}.a \
    -Wl,--no-whole-archive lib/lib{avutil,swresample}.a -Wl,-u,avutil_version \
    -lm -Wl,-Bsymbolic -o libffmpeg.so
}

package(){
  install -Dm644 release/libffmpeg.so \
    "$pkgdir/opt/${_browser}/libffmpeg.so.$_vivaldi_major_version"
}
