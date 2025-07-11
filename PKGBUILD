# Maintainer: Arne Brücher <archlinux[at]arne-bruecher[dot]de>
# Maintainer: oech3
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-ffmpeg-codecs
# Bump minor ver of Chromiumver from opera:about
_chromium=135.0.7049.128
url='https://chromium.googlesource.com/chromium/third_party/ffmpeg'
_commit=$(curl -sL https://raw.githubusercontent.com/chromium/chromium/refs/tags/${_chromium}/DEPS | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
_ffmpeg=$(curl -s ${url}/+/${_commit}/RELEASE?format=TEXT|base64 -d)
pkgver=${_chromium}.ffmpeg$_ffmpeg
pkgrel=2
pkgdesc="Add codecs to Opera"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=(glibc)
makedepends=(nasm git)
# tarball is something wrong
source=("chromium-ffmpeg::git+${url}.git#commit=${_commit}"
off-opera-ffmpeg.hook on-opera-ffmpeg.install)
install=on-opera-ffmpeg.install
sha256sums=('ef9d0877853ea4678c5ad84c40e145785280af4e54251710f5a905d7ded2262d'
            'cf61ed6d89c84f1f999af8e126395fdad05e4bb898d900178673b626f0204e12'
            'f243a58140022f927515cba982a2286894159eb0f5ea84992e904872007db820')

prepare() {
  cd chromium-ffmpeg
  # Use native opus decoder not in kAllowedAudioCodecs
  sed -i.bak "s/^ *\.p\.name *=.*/.p.name=\"libopus\",/" libavcodec/opus/dec.c
  diff libavcodec/opus/dec.c{.bak,} || :
}

build() {
  cd chromium-ffmpeg
  # See BUILD.gn and chromium/config/Chrome/linux/x64/
  ./configure \
    --disable-{debug,all,autodetect,doc,iconv,network,symver} \
    --disable-{error-resilience,faan,iamf} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-swresample \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,mp3,aac,h264 \
    --enable-parser=aac,flac,h264,mpegaudio,opus,vorbis,vp9 \
    --extra-cflags="-fno-math-errno -fno-signed-zeros -fno-semantic-interposition $LTOFLAGS" \
    --enable-{pic,asm,hardcoded-tables} \
    --prefix="${srcdir}"/release

  make install
  #_symbols=$(cat chromium/ffmpeg.sigs | grep -oE '\bav[a-z0-9_]*\s*\(' - | sed 's/(//' | awk '{print "-Wl,-u," $1}'|paste -sd ' ' -)
  cd ../release
  gcc $LTOFLAGS -shared $LDFLAGS \
    -Wl,--whole-archive lib/lib{avcodec,avformat}.a \
    -Wl,--no-whole-archive lib/lib{avutil,swresample}.a -Wl,-u,avutil_version \
    -lm -Wl,-Bsymbolic -o libffmpeg.so
}

package(){
  install -Dm644 release/libffmpeg.so "$pkgdir/usr/lib/opera/lib_extra/libffmpeg.so"
  # Block LD_PRELOAD even this works without it. It breaks many things.
  install -Dm644 off-opera-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks

  #echo Make sure every operas have same major Chromium ver
  conflicts=(opera-{beta,developer}-ffmpeg-codecs)
  provides=(opera-{beta,developer}-ffmpeg-codecs)
  install -d "$pkgdir"/usr/lib/opera-{beta,developer}/lib_extra
  ln -svf /usr/lib/opera/lib_extra/libffmpeg.so "$pkgdir"/usr/lib/opera-beta/lib_extra/libfmpeg.so
  ln -svf /usr/lib/opera/lib_extra/libffmpeg.so "$pkgdir"/usr/lib/opera-developer/lib_extra/libfmpeg.so
}
