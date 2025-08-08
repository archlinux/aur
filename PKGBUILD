# Maintainer: Arne Brücher <archlinux[at]arne-bruecher[dot]de>
# Maintainer: oech3
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=opera-ffmpeg-codecs
# Bump Chromiumver from opera:about if libavcodec.so's have same major soname
_codecformatutil=61.61.59
_chromium=137.0.7151.138
url=https://chromium.googlesource.com/chromium/third_party/ffmpeg
_commit=$(curl -sL https://chromium.googlesource.com/chromium/src.git/+/refs/tags/${_chromium}/DEPS?format=TEXT | base64 -d | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
pkgver=${_chromium}.sonames$_codecformatutil
pkgrel=2
_so=libffmpeg.so
pkgdesc='Add codecs to Opera (vendored ffmpeg with same sonames)'
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=(glibc)
makedepends=(nasm git
diffutils gcc make) # base-devel
source=("chromium-ffmpeg::git+${url}.git#commit=${_commit}"
off-opera-ffmpeg.hook on-opera-ffmpeg.install)
install=on-opera-ffmpeg.install
sha256sums=('30302075945c01c8d5d0ee1ca1d2958e6aadf5938bfdc7ba26cc4a524ecb8f3f'
            'cf61ed6d89c84f1f999af8e126395fdad05e4bb898d900178673b626f0204e12'
            'f243a58140022f927515cba982a2286894159eb0f5ea84992e904872007db820')

prepare() {
  echo Use chromium-ffmpeg-codecs instead of $pkgname #as this lacks some optimization configs.
  cd chromium-ffmpeg
  # List used funcs
  grep -oP '\bav[a-z0-9_]*(?=\s*\()' chromium/ffmpeg.sigs > ../sigs.txt
  echo -e "avformat_version\navutil_version\nff_h264_decode_init_vlc" >> ../sigs.txt # only for opera
  echo -e "{\nglobal:\n$(sed 's/$/;/' ../sigs.txt)\nlocal:\n*;\n};" > ../export.map
  # Use native opus decoder not in kAllowedAudioCodecs
  sed -i.bak "s/^ *\.p\.name *=.*/.p.name=\"libopus\",/" libavcodec/opus/dec.c
  #diff libavcodec/opus/dec.c{.bak,} || :
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
    --enable-demuxer=ogg,matroska,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,mp3,aac,h264 \
    --enable-parser=aac,flac,h264,mpegaudio,opus,vorbis,vp9 \
    --extra-cflags="-DCHROMIUM_NO_LOGGING" \
    --extra-cflags="-fno-math-errno -fno-signed-zeros -fno-semantic-interposition -fomit-frame-pointer $LTOFLAGS" \
    --enable-{pic,asm,hardcoded-tables} \
    --libdir=/

  make DESTDIR=.. install
  cd ..
  _symbols=$(awk '{print "-Wl,-u," $1}' sigs.txt | paste -sd ' ' -)
  gcc $LTOFLAGS -shared $LDFLAGS \
    -Wl,--start-group libav{codec,format,util}.a libswresample.a -Wl,--end-group \
    ${_symbols} -Wl,--version-script=export.map \
    -lm -Wl,-Bsymbolic -o $_so
}

package(){
  install -Dm644 $_so -t "$pkgdir"/usr/lib/opera/lib_extra
  # Block LD_PRELOAD which might breaks external apps
  install -Dm644 off-opera-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
  # symlink
  conflicts=(opera-{beta,developer}-ffmpeg-codecs)
  provides=(opera-{beta,developer}-ffmpeg-codecs)
  install -d "$pkgdir"/usr/lib/opera-{beta,developer}/lib_extra
  ln -svf /usr/lib/opera/lib_extra/$_so -t "$pkgdir"/usr/lib/opera-beta/lib_extra
  ln -svf /usr/lib/opera/lib_extra/$_so -t "$pkgdir"/usr/lib/opera-developer/lib_extra
}
