# Maintainer: oech3
pkgname=chromium-ffmpeg-codecs-git
pkgver=7.2.r120561.g7f150dc4b7
#pkgver() {
#  printf '%s.r%s.g%s' $(git -C ffmpeg describe --tags --long | awk -F'-' '{ sub(/^n/, "", $1); print $1 }') $(git -C ffmpeg describe --tags --match 'N' | awk -F'-' '{ print $2 }') $(git -C ffmpeg rev-parse --short HEAD)
#}
pkgrel=1
pkgdesc="Add codecs to Chromium M138+"
arch=('x86_64')
url=https://git.ffmpeg.org/ffmpeg
_url=https://chromium.googlesource.com/chromium/third_party/ffmpeg
license=('LGPL-2.1-or-later')
source=("git+${url}.git"
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/main/0001-Add-av_stream_get_first_dts-for-Chromium.patch)
sha256sums=('SKIP'
'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40')
depends=(glibc)
makedepends=(nasm git
diffutils gcc make patch) # base-devel
_so=libffmpeg.so
optdepends=(electron37": Manually symlink")
conflicts=(vivaldi{,-snapshot}-ffmpeg-codecs)
provides=("${conflicts[@]}")
prepare() {
  # List used funcs.
  curl -Ls ${_url}/+/refs/heads/master/chromium/ffmpeg.sigs?format=TEXT | base64 -d | grep -oP '\bav[a-z0-9_]*(?=\s*\()' > sigs.txt # skip csum
  echo -e "avformat_version\navutil_version\nff_h264_decode_init_vlc" >> sigs.txt # only for opera
  echo -e "{\nglobal:\n$(sed 's/$/;/' sigs.txt)\nlocal:\n*;\n};" |tee export.map
  cd ffmpeg
  # Use native opus not in kAllowedAudioCodecs (faster than libopus)
  sed -i.bak "s/^ *\.p\.name *=.*/.p.name=\"libopus\",/" libavcodec/opus/dec.c
  diff libavcodec/opus/dec.c{.bak,}||:
  # Chromium patches
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch # needed
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
    --enable-demuxer=ogg,matroska,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,mp3,aac,h264 \
    --enable-parser=aac,flac,h264,mpegaudio,opus,vorbis,vp9 \
    --extra-cflags="-fno-math-errno -fno-signed-zeros -fno-semantic-interposition ${LTOFLAGS}" \
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
  install -Dm644 $_so "${pkgdir}"/usr/lib/${pkgname}/$_so
  install -d "${pkgdir}"/opt/vivaldi{,-snapshot}
  for _n in 7.5 7.6 7.7 7.8 7.9 8.0; do
    ln -svf /usr/lib/${pkgname}/$_so "$pkgdir"/opt/vivaldi/${_so}.$_n
    ln -svf /usr/lib/${pkgname}/$_so "$pkgdir"/opt/vivaldi-snapshot/${_so}.$_n
  done
}
