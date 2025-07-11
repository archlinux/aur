# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >

_browser=opera-developer
pkgname=${_browser}-ffmpeg-codecs
_note='Make sure every operas have same major Chromium,ffmpeg ver'
# Bump minor ver of Chromiumver from opera:about
_chromium=135.0.7049.128
url='https://chromium.googlesource.com/chromium/third_party/ffmpeg'
_commit=$(curl -sL https://raw.githubusercontent.com/chromium/chromium/refs/tags/${_chromium}/DEPS | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
_ffmpeg=$(curl -s ${yrl}/+/${_commit}/RELEASE?format=TEXT|base64 -d)
pkgver=${_chromium}.ffmpeg$_ffmpeg
pkgrel=1
pkgdesc="Add codecs to ${_browser}"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=(glibc)
makedepends=(nasm git)
# tarball is something wrong
source=("chromium-ffmpeg::git+${url}.git#commit=${_commit}"
off-${_browser}-ffmpeg.hook on-${_browser}-ffmpeg.install)
install=on-${_browser}-ffmpeg.install
sha256sums=('ef9d0877853ea4678c5ad84c40e145785280af4e54251710f5a905d7ded2262d'
            '2f118dfca4d3097432000b62f8247ef86afd66a9681c1dfa71adf86783587ed4'
            '4918ba2449b39274878268c5956b604992c504b89660469c93864e44de8c62aa')

prepare() {
  cd chromium-ffmpeg
  echo $_note
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
    --extra-cflags="-fno-math-errno -fno-signed-zeros $LTOFLAGS" \
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
  install -Dm644 release/libffmpeg.so "$pkgdir/usr/lib/${_browser}/lib_extra/libffmpeg.so"
  # Block LD_PRELOAD even this works without it. It breaks many things.
  install -Dm644 off-${_browser}-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
}
