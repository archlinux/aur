
pkgname=chromium-ffmpeg-codecs-git
# sparse checkout
pkgver=7.2.r119684.g670089304a
pkgrel=8
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium M138+ (non vendored ffmpeg)"
arch=('x86_64')
url=https://git.ffmpeg.org/ffmpeg
_url=https://chromium.googlesource.com/chromium/third_party/ffmpeg
license=('LGPL-2.1-or-later')
_chromium=138.0.7204.55
_chrff=$(curl -sL https://raw.githubusercontent.com/chromium/chromium/refs/tags/${_chromium}/DEPS | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
source=( "sigs.base64::${_url}/+/refs/heads/master/chromium/ffmpeg.sigs?format=TEXT"
"${_chromium}sigs.base64::${_url}/+/${_chrff}/chromium/ffmpeg.sigs?format=TEXT"
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/main/0001-Add-av_stream_get_first_dts-for-Chromium.patch)
sha256sums=('65baa55bb8b32d43e4606ff84029f5180ab318bdf02011e1f3b510f873992341'
            '65baa55bb8b32d43e4606ff84029f5180ab318bdf02011e1f3b510f873992341'
            'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40')
conflicts[0]='SKIP'
depends=(glibc)
makedepends=(nasm git
diffutils gcc make patch sed) # base-devel
conflicts=(vivaldi{,-snapshot}-ffmpeg-codecs)
provides=("${conflicts[@]}")
prepare() {
  # Lust used funcs
  base64 -d ${_chromium}sigs.base64 | grep -oP '\bav[a-z0-9_]*(?=\s*\()' > ${_chromium}sigs.txt
  base64 -d sigs.base64 | grep -oP '\bav[a-z0-9_]*(?=\s*\()' > sigs.txt
  diff {${_chromium},git}sigs.txt || echo ffmpeg.sigs was changed at upstream. Please OOD $pkgname
  echo -e "avformat_version\navutil_version\nff_h264_decode_init_vlc" >> sigs.txt # only for opera
  echo -e "{\nglobal:" > export.map
  sed 's/$/;/' sigs.txt >> export.map
  echo -e "local:\n*;\n};" >> export.map
  # sparse checkout
  rm -rf ffmpeg
  git clone --depth=1 ${url}
  cd ffmpeg
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch
  # Use native opus decoder not in kAllowedAudioCodecs
  sed -i.bak "s/^ *\.p\.name *=.*/.p.name=\"libopus\",/" libavcodec/opus/dec.c
  diff libavcodec/opus/dec.c{.bak,} || :
  # soname
  grep -E 'LIBAVCODEC_VERSION_MAJOR +[0-9]' libavcodec/version_major.h
  grep -E 'LIBAVFORMAT_VERSION_MAJOR +[0-9]' libavformat/version_major.h
  grep -E 'LIBAVUTIL_VERSION_MAJOR +[0-9]' libavutil/version.h
}

build() {
  cd ffmpeg
  # ${_url}/+/refs/heads/master/
  # chromium/config/Chrome/linux/x64/ BUILD.gn
  ./configure \
    --disable-{debug,all,autodetect,doc,iconv,network,symver} \
    --disable-{error-resilience,faan,iamf} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-swresample \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,mp3,aac,h264 \
    --enable-parser=aac,flac,h264,mpegaudio,opus,vorbis,vp9 \
    --extra-cflags="-fuse-ld=mold -fno-math-errno -fno-signed-zeros -fno-semantic-interposition ${LTOFLAGS}" \
    --prefix="${srcdir}"/release \
    --enable-{pic,asm,hardcoded-tables}

  make install
  _symbols=$(cat ../sigs.txt | awk '{print "-Wl,-u," $1}'|paste -sd ' ' -)
  cd ../release
  gcc $LTOFLAGS -shared $LDFLAGS \
    -Wl,--start-group lib/libav{codec,format,util}.a lib/libswresample.a -Wl,--end-group \
    ${_symbols} -Wl,--version-script=../export.map \
    -lm -Wl,-Bsymbolic -o $_so
}

package(){
  install -Dm644 release/$_so "${pkgdir}"/usr/lib/${pkgname}/$_so
  install -d "${pkgdir}"/opt/vivaldi{,-snapshot}
  for n in 7.5 7.6 7.7 7.8 7.9 8.0; do
    ln -svf /usr/lib/${pkgname}/$_so "$pkgdir"/opt/vivaldi/${_so}.$n
    ln -svf /usr/lib/${pkgname}/$_so "$pkgdir"/opt/vivaldi-snapshot/${_so}.$n
  done
}
