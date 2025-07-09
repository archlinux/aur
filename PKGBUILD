# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-developer-ffmpeg-codecs
_note='Make sure every operas have same Chromium ver at opera:about'
pkgver=135.0.7049.115
_commit=$(curl -sL https://raw.githubusercontent.com/chromium/chromium/refs/tags/${pkgver}/DEPS | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
pkgrel=1
pkgdesc='Add codecs to opera-developer'
arch=('x86_64')
url='https://chromium.googlesource.com/chromium/third_party/ffmpeg'
license=('LGPL-2.1-or-later')
depends=(glibc)
makedepends=(nasm git)
source=("chromium-ffmpeg::git+${url}.git#commit=${_commit}"
#sigs-$pkgver::https://chromium.googlesource.com/chromium/third_party/ffmpeg/+/${_commit}/chromium/ffmpeg.sigs?format=TEXT
)
sha256sums=('ef9d0877853ea4678c5ad84c40e145785280af4e54251710f5a905d7ded2262d')

prepare() {
  echo $_note
  cd chromium-ffmpeg
  # Use native opus decoder not in kAllowedAudioCodecs
  sed -i '/^ *\.p\.name *=.*/c\.p.name="libopus",' libavcodec/opus/dec.c
}

build() {
  cd chromium-ffmpeg
  # See BUILD.gn and chromium/config/Chrome/linux/x64/
  ./configure \
    --disable-{all,autodetect,doc,iconv,network} \
    --disable-{error-resilience,faan,iamf} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-swresample \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,mp3,aac,h264 \
    --enable-parser=aac,flac,h264,mpegaudio,opus,vorbis,vp9 \
    --extra-cflags="-fno-math-errno -fno-signed-zeros $LTOFLAGS" \
    --enable-{pic,asm,hardcoded-tables} \
    --prefix="${srcdir}"/release

  make install

  cd ../release
  #_symbols=$(base64 -d ../sigs-${pkgver} | grep -oE '\bav[a-z0-9_]*\s*\(' - | sed 's/(//' | awk '{print "-Wl,-u," $1}'|paste -sd ' ' -)
  gcc $LTOFLAGS -shared $LDFLAGS \
    -Wl,--whole-archive lib/lib{avcodec,avformat}.a \
    -Wl,--no-whole-archive lib/lib{avutil,swresample}.a -Wl,-u,avutil_version \
    -lm -Wl,-Bsymbolic -o libffmpeg.so
}

package(){
  # Merge this package to opera-ffmpeg-codecs by symlink
  install -Dm644 release/libffmpeg.so "$pkgdir/usr/lib/opera-developer/lib_extra/libffmpeg.so"
}
