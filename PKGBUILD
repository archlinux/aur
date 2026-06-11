
pkgname=chromium-ffmpeg-git
pkgver=8.1.r121759.ge096a592cb
pkgver(){
  printf '%s.r%s.g%s' $(git -C ffmpeg describe --tags --long | awk -F'-' '{ sub(/^n/, "", $1); print $1 }') \
    $(git -C ffmpeg describe --tags --match 'N' | awk -F'-' '{ print $2 }') $(git -C ffmpeg rev-parse --short HEAD)
}
pkgrel=1
pkgdesc="Add codecs to Chromium (libavcodec ??)"
arch=('x86_64')
url=https://git.ffmpeg.org/ffmpeg
_url=https://chromium.googlesource.com/chromium/third_party/ffmpeg
license=('LGPL-2.1-or-later')
install=${pkgname%-git}.install
source=(
"sigs.base64::${_url}/+/refs/heads/master/chromium/ffmpeg.sigs?format=TEXT"
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/main/0001-Add-av_stream_get_first_dts-for-Chromium.patch
git+${url}.git $install
${pkgname%-*}.hook::https://aur.archlinux.org/cgit/aur.git/plain/${pkgname%-*}.hook?h=${pkgname%-*}
)

b2sums=('046f7fcb32ccd2d18a8a85a6ef4e1445cb6af682fb75999b12b60cd900fc4d37962dd86fc3f0201ec23ba296a834a01139ba379fabb33b1b49fa331a876593d5'
        'e5f7b79f7731be9ee5a7280a9221fb531ac5a2d9820fc5870b68b0eabea667dfbe8f39f41c1e1763a4c84982896afaa54c81ff57847d203b70afafd726689e5d'
        'SKIP'
        'abd7a259599872b1d499de65d4416ac454de3f473b27f7ec15f3472291bd474f861bbe231d3450d8297c2947d731a236aeb768f6e72d2bf90794876173f252f1'
        'a8000673adc6116969b58dbb88d6bfe1c092b7d6bb4db18216ff847b3132fecd62832ced0a0efedb8960c3c2070e168961a636d6d042fd9abb2caeb9dc15f8e9')
depends=(glibc)
makedepends=(nasm git
gcc make sed) # base-devel
_so=libffmpeg.so
conflicts=(${pkgname%-git}
{nwjs,vivaldi{,-snapshot}}-ffmpeg-codecs)
provides=("${conflicts[@]}")
prepare() {
  # List used funcs
  base64 -d ${_chromium}sigs.base64 | grep -oP '\bav[a-z0-9_]*(?=\s*\()' > sigs.txt
  echo -e "avformat_version\navutil_version\nff_h264_decode_init_vlc" >> sigs.txt # only for opera
  echo -e "{\nglobal:\n$(sed 's/$/;/' sigs.txt)\nlocal:\n*;\n};" > export.map
  
  cd ffmpeg
  # Use native opus not in kAllowedAudioCodecs
  sed -i.bak "s/^ *\.p\.name *=.*/.p.name=\"libopus\",/" libavcodec/opus/dec.c
  # Chromium patches
  git apply -v -p1 ../0001-Add-av_stream_get_first_dts-for-Chromium.patch # needed
  sed -i.bak '/ff_aom_uninit_film_grain_params/d' libavcodec/h2645_sei.c
  sed -i.bak -E -e "/&ff_dirac_codec,/d" -e "/&ff_speex_codec,/d" \
    -e "/&ff_theora_codec,/d" -e "/&ff_celt_codec,/d" -e "/&ff_old_dirac_codec,/d" libavformat/oggdec.c # buggy or unused
  sed -i.bak 's/^int av_sscanf(.*/#define av_sscanf sscanf/' libavutil/avstring.h
  # CHROMIUM_NO_LOGGING
  _av_log=$(grep 'void av_log(' libavutil/log.c)
  _av_log_once=$(grep 'void av_log_once(' libavutil/log.c)
  _av_vlog=$(grep 'void av_vlog(' libavutil/log.c)
  sed -i.bak -E "/^void\s+(av_log|av_log_once|av_vlog)\s*\(.*\)\s*$/,/^\s*\}\s*$/d" libavutil/log.c
  echo -e "${_av_log}{}\n${_av_log_once}{}\n${_av_vlog}{}" >> libavutil/log.c
}

build() {
  cd ffmpeg
  # ${_url}/+/refs/heads/master/chromium/config/Chrome/linux/x64/
  # BUILD.gn
  ./configure \
    --disable-{debug,all,autodetect,doc,iconv,network,symver,large-tests} \
    --disable-{error-resilience,faan,iamf} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-swresample \
    --enable-demuxer=ogg,matroska,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,mp3,aac,h264 \
    --enable-parser=aac,flac,h264,mpegaudio,opus,vorbis,vp9 \
    --extra-cflags="-fno-math-errno -fno-signed-zeros -fno-semantic-interposition -fomit-frame-pointer ${LTOFLAGS}" \
    --enable-{pic,asm,hardcoded-tables} \
    --libdir=/
  make DESTDIR=.. install
  cd ..
  _symbols=$(sed 's/^/-Wl,-u,/' sigs.txt | paste -sd ' ' -)
  gcc $LTOFLAGS -shared $LDFLAGS \
    -Wl,--start-group libav{codec,format,util}.a libswresample.a -Wl,--end-group \
    $_symbols -Wl,--version-script=export.map \
    -lm -Wl,-Bsymbolic -o $_so
}

package(){
  _avcodec=$(grep -oP 'LIBAVCODEC_VERSION_MAJOR\s+\K\d+' ffmpeg/libavcodec/version_major.h)
  install -Dvm644 $_so "${pkgdir}"/usr/lib/${_so}.$_avcodec
  ln -sf ${_so}.$_avcodec "${pkgdir}"/usr/lib/$_so
  sed "s/^Target=${pkgname%-*}.*/Target=${pkgname}/" ${pkgname%-*}.hook > ${pkgname}.hook
  install -Dm644 ${pkgname}.hook -t "$pkgdir"/usr/share/libalpm/hooks
  # Block DL binary
  install -d "${pkgdir}"/opt/vivaldi{,-snapshot}
  touch "$pkgdir"/opt/vivaldi{,-snapshot}/${_so}.{8.0,8.1,8.2,8.3,8.4,8.5,8.6,8.7,8.8,8.9}
}
