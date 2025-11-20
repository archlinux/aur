# Maintainer: oech3

pkgname=chromium-ffmpeg
_avcodec=62
pkgver=8.0.1
pkgrel=1
pkgdesc="Add codecs to Chromium M138+ (libavcodec ${_avcodec})"
arch=('x86_64')
url=https://ffmpeg.org/
_url=https://chromium.googlesource.com/chromium/third_party/ffmpeg
license=('LGPL-2.1-or-later')
install=chromium-ffmpeg.install
source=(
$install ${pkgname}.hook ${url}releases/ffmpeg-${pkgver}.tar.xz
"no-xheaac-parser.patch.base64::${_url}/+/30735bb16a66e84d6324b5858eef314822b6d419%5E%21/?format=TEXT"
"sigs.base64::${_url}/+/refs/heads/master/chromium/ffmpeg.sigs?format=TEXT"
"aac.patch.base64::${_url}/+/a21071589971c54596dbbccbccdbac7bdd9d4e4c%5E%21/?format=TEXT"
"aacREADME.base64::${_url}/+/bdcb0b447f433de3b69f0252732791b9f7e26f37/chromium/patches/README?format=TEXT"
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/2-${pkgver}-1/0001-Add-av_stream_get_first_dts-for-Chromium.patch
)

sha256sums=('684a839ddd1aa3a25a938cad68867341fd43be10a0a8cce59487353b471d6005'
            'c6ce8624456bad1e34941af3fa4f0f21fed5f8c6f9687ee1e0daee10a72a0bbd'
            '05ee0b03119b45c0bdb4df654b96802e909e0a752f72e4fe3794f487229e5a41'
            '95381d849385ed1038ef122722d18340b74609cd6317f9679fb4029a09a54d05'
            '65baa55bb8b32d43e4606ff84029f5180ab318bdf02011e1f3b510f873992341'
            'ef5afc6ea3e9874dec5139725e17215bd0402d88a27426ac2b707f4484bba234'
            'bd6b1bbb42370b8443e1b18732fe434d134a7e8344e92befdfb9b514f6167660'
            'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40')
depends=(glibc)
makedepends=(nasm
gcc make patch) # base-devel
_so=libffmpeg.so
conflicts=({nwjs,opera{,-beta,-developer},vivaldi{,-snapshot}}-ffmpeg-codecs)
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
  mkdir -p chromium/patches; base64 -d ../aacREADME.base64 > chromium/patches/README
  base64 -d ../aac.patch.base64 > aac.patch
  patch -Np1 -i aac.patch
  base64 -d ../no-xheaac-parser.patch.base64 > no-xheaac-parser.patch
  patch -Np1 -i no-xheaac-parser.patch
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
  touch "$pkgdir"/opt/vivaldi{,-snapshot}/${_so}.{7.7,7.8,7.9,8.0,8.1,8.2,8.3,8.4,8.5,8.6,8.7}

  for _n in {37..50} ; do
    install -d "${pkgdir}"/usr/lib/electron${_n}/glibc-hwcaps/x86-64-v2
    ln -sf /usr/lib/${_so}.$_avcodec "${pkgdir}"/usr/lib/electron${_n}/glibc-hwcaps/x86-64-v2/$_so
  done  
}
