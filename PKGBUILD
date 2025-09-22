# vim:set ft=sh ts=2 sw=2 et:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: oech3

_browser=vivaldi-snapshot
pkgname=${_browser}-ffmpeg-codecs
pkgver=140.0.7339.202
_vivaldi_major_version=7.7
_commit=d2d06b12c22d27af58114e779270521074ff1f85
#_commit=$(curl -sL "https://chromium.googlesource.com/chromium/src.git/+/refs/tags/${pkgver}/DEPS?format=TEXT" | base64 -d | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
pkgrel=1
pkgdesc="additional support for proprietary codecs for ${_browser}"
arch=('x86_64')
url='https://chromium.googlesource.com/chromium/third_party/ffmpeg'
license=('LGPL-2.1-or-later')
depends=(glibc)
makedepends=(nasm git)
options=(!debug)
source=("chromium-ffmpeg::git+${url}.git#commit=${_commit}")
sha256sums=('491c843c8d3a1ce935d835ea1b20687e8537c1eb888cb9d53ddd7f5c4844ab5f')

prepare() {
  cd chromium-ffmpeg
  # List used functions
  grep -oP '\bav[a-z0-9_]*(?=\s*\()' chromium/ffmpeg.sigs > "${srcdir}/sigs.txt"
  echo -e "avformat_version\navutil_version\nff_h264_decode_init_vlc" >> "${srcdir}/sigs.txt" # for opera. Some one may want use this binary. Effect for size is few.
  echo -e "{\nglobal:" > "${srcdir}/export.map"
  sed 's/$/;/' "${srcdir}/sigs.txt" >> "${srcdir}/export.map"
  echo -e "local:\n*;\n};" >> "${srcdir}/export.map"
  # Use native opus decoder not in kAllowedAudioCodecs at
  # https://github.com/chromium/chromium/blob/${_pkgver}/media/ffmpeg/ffmpeg_common.cc
  sed -i.bak "s/^ *\.p\.name *=.*/.p.name=\"libopus\",/" libavcodec/opus/dec.c
  diff libavcodec/opus/dec.c{.bak,} || :
}

build() {
  cd chromium-ffmpeg
  # See BUILD.gn and chromium/config/Chrome/linux/x64/
  # removed codecs: pcm_alaw,pcm_f32le,pcm_mulaw,pcm_s16be,pcm_s24be,pcm_s24le,pcm_s32le,pcm_u8
  ./configure \
    --disable-{debug,all,autodetect,doc,iconv,network,symver,large-tests} \
    --disable-{error-resilience,faan,iamf} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-swresample \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,mp3,aac,h264 \
    --enable-parser=aac,flac,h264,mpegaudio,opus,vorbis,vp9 \
    --extra-cflags="-DCHROMIUM_NO_LOGGING" \
    --extra-cflags="-fno-math-errno -fno-signed-zeros -fno-semantic-interposition -fomit-frame-pointer $LTOFLAGS" \
    --enable-{pic,asm,hardcoded-tables} \
    --libdir=/

  make DESTDIR="${srcdir}" install
  cd "${srcdir}"
  _symbols=$(sed 's/^/-Wl,-u,/' "${srcdir}/sigs.txt" | paste -sd ' ' -)
  gcc $LTOFLAGS -shared $LDFLAGS \
    -Wl,--start-group libav{codec,format,util}.a libswresample.a -Wl,--end-group \
    ${_symbols} -Wl,--version-script="${srcdir}/export.map" \
    -lm -Wl,-Bsymbolic -o libffmpeg.so
}

package(){
  install -Dm644 libffmpeg.so \
    "$pkgdir/opt/${_browser}/libffmpeg.so.$_vivaldi_major_version"
}
