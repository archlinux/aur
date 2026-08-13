# Maintainer: oech3

pkgname=chromium-ffmpeg
_avcodec=62
pkgver=8.1.2
pkgrel=1
pkgdesc="Add codecs to Chromium M138+ (libavcodec ${_avcodec})"
arch=('x86_64')
url=https://ffmpeg.org/
_url=https://chromium.googlesource.com/chromium/third_party/ffmpeg
license=('LGPL-2.1-or-later')
install=chromium-ffmpeg.install
source=(
$install ${pkgname}.hook ${url}releases/ffmpeg-${pkgver}.tar.xz
"sigs.base64::${_url}/+/refs/heads/master/chromium/ffmpeg.sigs?format=TEXT"
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/2-${pkgver}-1/0001-Add-av_stream_get_first_dts-for-Chromium.patch
)

b2sums=('abd7a259599872b1d499de65d4416ac454de3f473b27f7ec15f3472291bd474f861bbe231d3450d8297c2947d731a236aeb768f6e72d2bf90794876173f252f1'
        '371ab8750f8a27a2506af0379765d309031de83e4b7e2100fcef0bb130522ef0427998b0cdbc0b06fea924efb8c91e032c020d0f7643069fef48a83c40c51225'
        'b37849fd89cdbc336700227c804d7642e0d2e4024359d15f4c3659cd41465145946b362fb61e0dc0141730f1d0352e2a2bf33d513213b2b3b68978be766b5914'
        '046f7fcb32ccd2d18a8a85a6ef4e1445cb6af682fb75999b12b60cd900fc4d37962dd86fc3f0201ec23ba296a834a01139ba379fabb33b1b49fa331a876593d5'
        'e5f7b79f7731be9ee5a7280a9221fb531ac5a2d9820fc5870b68b0eabea667dfbe8f39f41c1e1763a4c84982896afaa54c81ff57847d203b70afafd726689e5d')
depends=(glibc)
makedepends=(nasm
gcc make patch) # base-devel
_so=libffmpeg.so
conflicts=({nwjs,vivaldi{,-snapshot}}-ffmpeg-codecs)
provides=("${conflicts[@]}")
prepare() {
  # List used funcs
  base64 -d ${_chromium}sigs.base64 | grep -oP '\bav[a-z0-9_]*(?=\s*\()' > sigs.txt
  echo -e "avformat_version\navutil_version\nff_h264_decode_init_vlc" >> sigs.txt # only for opera
  echo -e "{\nglobal:\n$(sed 's/$/;/' sigs.txt)\nlocal:\n*;\n};" > export.map
  
  cd ffmpeg-$pkgver
  # Use native opus not in kAllowedAudioCodecs
  sed -i.bak "s/^ *\.p\.name *=.*/.p.name=\"libopus\",/" libavcodec/opus/dec.c
  # Chromium patches
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch # needed
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
  cd ffmpeg-$pkgver
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
    ${_symbols} -Wl,--version-script=export.map \
    -lm -Wl,-Bsymbolic -o $_so
}

package(){
  install -Dm644 $_so "${pkgdir}"/usr/lib/${_so}.${_avcodec}
  ln -sf /usr/lib/${_so}.$_avcodec "$pkgdir"/usr/lib/${_so}
  install -Dm644 ${pkgname}.hook -t "$pkgdir"/usr/share/libalpm/hooks
  # Block DL binary
  install -d "${pkgdir}"/opt/vivaldi{,-snapshot}
  touch "$pkgdir"/opt/vivaldi{,-snapshot}/${_so}.{8.0,8.1,8.2,8.3,8.4,8.5,8.6,8.7,8.8,8.9,9.0}

  for _n in {37..50} ; do
    install -d "${pkgdir}"/usr/lib/electron${_n}/glibc-hwcaps/x86-64-v2
    ln -sf /usr/lib/${_so}.$_avcodec "${pkgdir}"/usr/lib/electron${_n}/glibc-hwcaps/x86-64-v2/$_so
  done  
}
