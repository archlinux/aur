
pkgname=chromium-ffmpeg-codecs-git
pkgver=7.2.r120402.g7c5319e692
#pkgver() {
  #printf '%s.r%s.g%s' $(git -C ffmpeg describe --tags --long | awk -F'-' '{ sub(/^n/, "", $1); print $1 }') $(git -C ffmpeg describe --tags --match 'N' | awk -F'-' '{ print $2 }') $(git -C ffmpeg rev-parse --short HEAD)
#}
pkgrel=1
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium M138+ (non vendored ffmpeg)"
arch=('x86_64')
url=https://git.ffmpeg.org/ffmpeg
_url=https://chromium.googlesource.com/chromium/third_party/ffmpeg
license=('LGPL-2.1-or-later')
_chromium=138.0.7204.55
_chrff=$(curl -sL https://raw.githubusercontent.com/chromium/chromium/refs/tags/${_chromium}/DEPS | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
source=("git+${url}.git"
"sigs.base64::${_url}/+/refs/heads/master/chromium/ffmpeg.sigs?format=TEXT"
"${_chromium}sigs.base64::${_url}/+/${_chrff}/chromium/ffmpeg.sigs?format=TEXT"
"no-xheaac-parser.patch.base64::${_url}/+/30735bb16a66e84d6324b5858eef314822b6d419%5E%21/?format=TEXT"
"aac.patch.base64::${_url}/+/a21071589971c54596dbbccbccdbac7bdd9d4e4c%5E%21/?format=TEXT"
"aacREADME.base64::${_url}/+/bdcb0b447f433de3b69f0252732791b9f7e26f37/chromium/patches/README?format=TEXT"
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/main/0001-Add-av_stream_get_first_dts-for-Chromium.patch)
sha256sums=('SKIP'
            '65baa55bb8b32d43e4606ff84029f5180ab318bdf02011e1f3b510f873992341'
            '65baa55bb8b32d43e4606ff84029f5180ab318bdf02011e1f3b510f873992341'
            '95381d849385ed1038ef122722d18340b74609cd6317f9679fb4029a09a54d05'
            'ef5afc6ea3e9874dec5139725e17215bd0402d88a27426ac2b707f4484bba234'
            'bd6b1bbb42370b8443e1b18732fe434d134a7e8344e92befdfb9b514f6167660'
            'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40')
sha256sums[1]='SKIP'
depends=(glibc)
makedepends=(nasm git
diffutils gcc make patch) # base-devel
conflicts=(vivaldi{,-snapshot}-ffmpeg-codecs)
provides=("${conflicts[@]}")
prepare() {
  # List used funcs
  base64 -d sigs.base64 | grep -oP '\bav[a-z0-9_]*(?=\s*\()' > sigs.txt
  base64 -d ${_chromium}sigs.base64 | grep -oP '\bav[a-z0-9_]*(?=\s*\()' > oldsigs.txt
  diff {,old}sigs.txt || echo ffmpeg.sigs was changed. Please OOD $pkgname
  echo -e "avformat_version\navutil_version\nff_h264_decode_init_vlc" >> sigs.txt # only for opera
  echo -e "{\nglobal:\n$(sed 's/$/;/' sigs.txt)\nlocal:\n*;\n};" |tee export.map
  cd ffmpeg
  # Use native opus decoder not in kAllowedAudioCodecs
  sed -i.bak "s/^ *\.p\.name *=.*/.p.name=\"libopus\",/" libavcodec/opus/dec.c
  diff libavcodec/opus/dec.c{.bak,}||:
  # Chromium patches
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch # needed
  mkdir -p chromium/patches; base64 -d ../aacREADME.base64 > chromium/patches/README
  base64 -d ../aac.patch.base64 > aac.patch
  patch -Np1 -i aac.patch
  base64 -d ../no-xheaac-parser.patch.base64 > no-xheaac-parser.patch
  patch -Np1 -i no-xheaac-parser.patch
  sed -i '/ff_aom_uninit_film_grain_params/d' libavcodec/h2645_sei.c
  sed -i.bak -E -e "/&ff_dirac_codec,/d" -e "/&ff_speex_codec,/d" \
    -e "/&ff_theora_codec,/d" -e "/&ff_celt_codec,/d" -e "/&ff_old_dirac_codec,/d" libavformat/oggdec.c
  diff libavformat/oggdec.c{.bak,}||:
  sed -i.bak 's/^int av_sscanf(.*/#define av_sscanf sscanf/' libavutil/avstring.h # not 8 kb
  # CHROMIUM_NO_LOGGING
  _av_log=$(grep 'void av_log(' libavutil/log.c)
  _av_log_once=$(grep 'void av_log_once(' libavutil/log.c)
  _av_vlog=$(grep 'void av_vlog(' libavutil/log.c)
  sed -i.bak -E "/^void\s+(av_log|av_log_once|av_vlog)\s*\(.*\)\s*$/,/^\s*\}\s*$/d" libavutil/log.c
  echo -e "${_av_log}{}\n${_av_log_once}{}\n${_av_vlog}{}" >> libavutil/log.c
  diff libavutil/log.c{.bak,}||:
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
    --extra-cflags="-fno-math-errno -fno-signed-zeros -fno-semantic-interposition ${LTOFLAGS}" \
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
  install -Dm644 $_so "${pkgdir}"/usr/lib/${pkgname}/$_so
  install -d "${pkgdir}"/opt/vivaldi{,-snapshot}
  for _n in 7.5 7.6 7.7 7.8 7.9 8.0; do
    ln -svf /usr/lib/${pkgname}/$_so "$pkgdir"/opt/vivaldi/${_so}.$_n
    ln -svf /usr/lib/${pkgname}/$_so "$pkgdir"/opt/vivaldi-snapshot/${_so}.$_n
  done
}
