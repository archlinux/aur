# Maintainer: oech3
pkgname=chromium-ffmpeg-legacy
_avcodec=61
_chromium=137.0.7151.138
_chrff=$(curl -sL https://chromium.googlesource.com/chromium/src.git/+/refs/tags/${_chromium}/DEPS?format=TEXT | base64 -d | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
pkgver=7.1.1
pkgrel=2
pkgdesc="Add codecs to Chromium M137- (libavcodec ${_avcodec})"
arch=('x86_64')
url=https://ffmpeg.org/
_url=https://chromium.googlesource.com/chromium/third_party/ffmpeg
license=('LGPL-2.1-or-later')
install=on-opera-ffmpeg.install
source=(${url}releases/ffmpeg-${pkgver}.tar.xz
"AVFMT_FLAG_NOVIDEOPARSE.patch.base64::${_url}/+/594bc6d3246fe6b293f253d07c8905c578cb75c9%5E%21/?format=TEXT"
"no-xheaac-parser.patch.base64::${_url}/+/30735bb16a66e84d6324b5858eef314822b6d419%5E%21/?format=TEXT"
"${_chromium}sigs.base64::${_url}/+/${_chrff}/chromium/ffmpeg.sigs?format=TEXT"
"aac.patch.base64::${_url}/+/a21071589971c54596dbbccbccdbac7bdd9d4e4c%5E%21/?format=TEXT"
"aacREADME.base64::${_url}/+/bdcb0b447f433de3b69f0252732791b9f7e26f37/chromium/patches/README?format=TEXT"
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/2-${pkgver}-1/0001-Add-av_stream_get_first_dts-for-Chromium.patch
block-opera-ldpreload.hook ${install})

sha256sums=('733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1'
            '40b05c04cca3fa8901fb40bf95e3e3d938c7afd1eaa884209f8667359471246c'
            '95381d849385ed1038ef122722d18340b74609cd6317f9679fb4029a09a54d05'
            'e1f511613c739870ae886a7814d876c179b0938bc331656342a24fbefe0eac01'
            'ef5afc6ea3e9874dec5139725e17215bd0402d88a27426ac2b707f4484bba234'
            'bd6b1bbb42370b8443e1b18732fe434d134a7e8344e92befdfb9b514f6167660'
            'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40'
            'd4d342d5850e98e7749d3642b74b32e3cf97b4f19f65a0429ef9b940601fdb5f'
            'f243a58140022f927515cba982a2286894159eb0f5ea84992e904872007db820')
depends=(glibc)
makedepends=(nasm
diffutils gcc make patch) # base-devel
_so=libffmpeg.so
conflicts=(opera{,-developer,-beta}-ffmpeg-codecs)
provides=("${conflicts[@]}")
replaces=("${conflicts[@]}") # remove at next bump
prepare() {
  # List used funcs
  base64 -d ${_chromium}sigs.base64 | grep -oP '\bav[a-z0-9_]*(?=\s*\()' > sigs.txt
  echo -e "avformat_version\navutil_version\nff_h264_decode_init_vlc" >> sigs.txt # only for opera
  echo -e "{\nglobal:\n$(sed 's/$/;/' sigs.txt)\nlocal:\n*;\n};" > export.map
  
  cd ffmpeg-$pkgver
  # Use native opus not in kAllowedAudioCodecs
  sed -i.bak "s/^ *\.p\.name *=.*/.p.name=\"libopus\",/" libavcodec/opus/dec.c #diff libavcodec/opus/dec.c{.bak,}||:
  # Chromium patches
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch # needed
  mkdir -p chromium/patches; base64 -d ../aacREADME.base64 > chromium/patches/README
  base64 -d ../aac.patch.base64 > aac.patch
  patch -Np1 -i aac.patch
  base64 -d ../no-xheaac-parser.patch.base64 > no-xheaac-parser.patch
  patch -Np1 -i no-xheaac-parser.patch
  base64 -d ../AVFMT_FLAG_NOVIDEOPARSE.patch.base64 > AVFMT_FLAG_NOVIDEOPARSE.patch
  patch -Np1 -i AVFMT_FLAG_NOVIDEOPARSE.patch
  sed -i.bak '/ff_aom_uninit_film_grain_params/d' libavcodec/h2645_sei.c
  sed -i.bak -E -e "/&ff_dirac_codec,/d" -e "/&ff_speex_codec,/d" \
    -e "/&ff_theora_codec,/d" -e "/&ff_celt_codec,/d" -e "/&ff_old_dirac_codec,/d" libavformat/oggdec.c # buggy or unused
  #diff libavformat/oggdec.c{.bak,}||:
  sed -i.bak 's/^int av_sscanf(.*/#define av_sscanf sscanf/' libavutil/avstring.h
  #diff libavutil/avstring.h{.bak,}||:
  # CHROMIUM_NO_LOGGING
  _av_log=$(grep 'void av_log(' libavutil/log.c)
  _av_log_once=$(grep 'void av_log_once(' libavutil/log.c)
  _av_vlog=$(grep 'void av_vlog(' libavutil/log.c)
  sed -i.bak -E "/^void\s+(av_log|av_log_once|av_vlog)\s*\(.*\)\s*$/,/^\s*\}\s*$/d" libavutil/log.c
  echo -e "${_av_log}{}\n${_av_log_once}{}\n${_av_vlog}{}" >> libavutil/log.c
  #diff libavutil/log.c{.bak,}
  # https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/1464930696f593320352a6f928fad6f50ade8f8b
  sed -i.bak '/check_optflags*.-fno-tree-vectorize/d' configure
  #diff configure{.bak,}||:
}

build() {
  cd ffmpeg-$pkgver
  # ${_url}/+/refs/heads/master/chromium/config/Chrome/linux/x64/
  # BUILD.gn
  ./configure \
    --disable-{debug,all,autodetect,doc,iconv,network,symver} \
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
  _symbols=$(awk '{print "-Wl,-u," $1}' sigs.txt | paste -sd ' ' -)
  gcc $LTOFLAGS -shared $LDFLAGS \
    -Wl,--start-group libav{codec,format,util}.a libswresample.a -Wl,--end-group \
    ${_symbols} -Wl,--version-script=export.map \
    -lm -Wl,-Bsymbolic -o $_so
}

package(){
  install -Dvm644 $_so "${pkgdir}"/usr/lib/${_so}.${_avcodec}
  install -d "$pkgdir"/usr/lib/opera{,-beta,-developer}/lib_extra
  for _f in "$pkgdir"/usr/lib/opera{,-beta,-developer}/lib_extra
    do ln -svf /usr/lib/$_so.${_avcodec} "$_f/$_so"
  done
  install -Dvm644 block-opera-ldpreload.hook -t "$pkgdir"/usr/share/libalpm/hooks
}
