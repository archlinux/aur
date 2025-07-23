
pkgname=chromium-ffmpeg-codecs
_ffver=7.1.1
_codec=61
_format=61
_util=59
_chromium=137.0.7151.138
#_chrlow=126.0.6423.0
_chrff=$(curl -sL https://raw.githubusercontent.com/chromium/chromium/refs/tags/${_chromium}/DEPS | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
#_chrfflow=$(curl -sL https://raw.githubusercontent.com/chromium/chromium/refs/tags/${_chrlow}/DEPS | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
pkgver=${_ffver}.sonames${_codec}.${_format}.${_util}
pkgrel=1
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium M137- (non vendored ffmpeg)"
arch=('x86_64')
url=https://ffmpeg.org/
_url=https://chromium.googlesource.com/chromium/third_party/ffmpeg
license=('LGPL-2.1-or-later')
source=(${url}releases/ffmpeg-${_ffver}.tar.xz fetch-soname-by-chromium.sh
"${_chromium}sigs.base64::${_url}/+/${_chrff}/chromium/ffmpeg.sigs?format=TEXT"
#"${_chrlow}sigs.base64::${_url}/+/${_chrfflow}/chromium/ffmpeg.sigs?format=TEXT"
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/2-${pkgver}-1/0001-Add-av_stream_get_first_dts-for-Chromium.patch
off-other-ffmpeg.hook on-other-ffmpeg.install)
install=on-other-ffmpeg.install
sha256sums=('733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1'
            'e39c6d127cb7ed768eeebc5c388cf86967cfde855e6d99edc27daba8c412227c'
            'e1f511613c739870ae886a7814d876c179b0938bc331656342a24fbefe0eac01'
            'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40'
            '03263b84dfd79619d22a50538e0dc668a2a919d58471cde4d388f0999c66de22'
            '73c9e3d7685f291a5df13fd28dd04b6ffdc42ea73505cacbe6009c2cb5018be3')
depends=(glibc)
makedepends=(nasm
diffutils gcc make patch) # base-devel
optdepends=({slimjet,electron{31..36}}': replace ffmpeg')
conflicts=(opera{,-developer,-beta}-ffmpeg-codecs)
provides=(opera{,-developer,-beta}-ffmpeg-codecs)
prepare() {
  base64 -d ${_chromium}sigs.base64 | grep -oP '\bav[a-z0-9_]*(?=\s*\()' > sigs.txt 
  #base64 -d ${_chrlow}sigs.base64 | grep -oP '\bav[a-z0-9_]*(?=\s*\()' > oldsigs.txt 
  #diff {,old}sigs.txt
  #./fetch-soname-by-chromium.sh $_chromium > so.txt
  #./fetch-soname-by-chromium.sh $_chrlow > oldso.txt
  #diff so{,old}.txt

  echo -e "avformat_version\navutil_version\nff_h264_decode_init_vlc" >> sigs.txt # only for opera
  # mask symbols for binary size
  echo -e "{\nglobal:" > export.map
  sed 's/$/;/' sigs.txt >> export.map
  echo -e "local:\n*;\n};" >> export.map
  
  cd ffmpeg-$_ffver
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch
  # Use native opus not in kAllowedAudioCodecs
  sed -i.bak "s/^ *\.p\.name *=.*/.p.name=\"libopus\",/" libavcodec/opus/dec.c
  #diff libavcodec/opus/dec.c{.bak,} || :
  # Drop this at 7.1.2 # https://lists.ffmpeg.org/pipermail/ffmpeg-devel/2025-May/343409.html
  sed -i.bak  "s/h264_sei.o h2645_sei.o/h264_sei.o h2645_sei.o aom_film_grain.o/" libavcodec/Makefile
}

build() {
  cd ffmpeg-$_ffver
  # ${_url}/+/refs/heads/master/chromium/config/Chrome/linux/x64/
  # BUILD.gn
  ./configure \
    --disable-{debug,all,autodetect,doc,iconv,network,symver} \
    --disable-{error-resilience,faan,iamf} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-swresample \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,mp3,aac,h264 \
    --enable-parser=aac,flac,h264,mpegaudio,opus,vorbis,vp9 \
    --extra-cflags="-fno-math-errno -fno-signed-zeros -fno-semantic-interposition -fomit-frame-pointer ${LTOFLAGS}" \
    --enable-{pic,asm,hardcoded-tables} \
    --libdir=/

  make DESTDIR=.. install
  cd ..
  _symbols=$(cat sigs.txt | awk '{print "-Wl,-u," $1}'|paste -sd ' ' -)
  gcc $LTOFLAGS -shared $LDFLAGS \
    -Wl,--start-group libav{codec,format,util}.a libswresample.a -Wl,--end-group \
    ${_symbols} -Wl,--version-script=export.map \
    -lm -Wl,-Bsymbolic -o $_so
}

package(){
  install -Dm644 $_so "${pkgdir}"/usr/lib/$_so
  #install -d "${pkgdir}"/opt/vivaldi
  #ln -sf /usr/lib/$_so "$pkgdir"/opt/vivaldi/${_so}.7.5 # different soname
  # Block LD_PRELOAD
  install -Dm644 off-other-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
}
