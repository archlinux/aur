# Maintainer: oech3
pkgname=chromium-ffmpeg
_avcodec=62
_chromium=138.0.7204.233
_chrff=$(curl -sL https://chromium.googlesource.com/chromium/src.git/+/refs/tags/${_chromium}/DEPS?format=TEXT | base64 -d | grep -oP "'ffmpeg_revision': '\K[0-9a-f]{40}'" | tr -d \')
pkgver=8.0
pkgrel=1
pkgdesc="Add codecs to Chromium M138+ (libavcodec ${_avcodec})"
arch=('x86_64')
url=https://ffmpeg.org/
_url=https://chromium.googlesource.com/chromium/third_party/ffmpeg
license=('LGPL-2.1-or-later')
_commit=638b521c7b09e00514aa13ade43c389b4b40ddfd
install=remove-chromium-ffmpeg.install
source=(
$install replace-chromium-ffmpeg.hook https://github.com/FFmpeg/FFmpeg/archive/${_commit}.zip
"no-xheaac-parser.patch.base64::${_url}/+/30735bb16a66e84d6324b5858eef314822b6d419%5E%21/?format=TEXT"
"${_chromium}sigs.base64::${_url}/+/${_chrff}/chromium/ffmpeg.sigs?format=TEXT"
"aac.patch.base64::${_url}/+/a21071589971c54596dbbccbccdbac7bdd9d4e4c%5E%21/?format=TEXT"
"aacREADME.base64::${_url}/+/bdcb0b447f433de3b69f0252732791b9f7e26f37/chromium/patches/README?format=TEXT"
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/2-7.1.1-1/0001-Add-av_stream_get_first_dts-for-Chromium.patch
)

sha256sums=('90549fe900b87703b86fba8fa5dead8082da9f1c5fcbd2be2e9c39f4879b27ce'
            '0f4500d0f35d1fa561c5c41ce808386bb36d0702227ba00d33bd423ed26260ed'
            '0a7fdf8691f02cba4688f2f84f0c621d23cd935bc35db16c1691dfebf829b0c8'
            '95381d849385ed1038ef122722d18340b74609cd6317f9679fb4029a09a54d05'
            '65baa55bb8b32d43e4606ff84029f5180ab318bdf02011e1f3b510f873992341'
            'ef5afc6ea3e9874dec5139725e17215bd0402d88a27426ac2b707f4484bba234'
            'bd6b1bbb42370b8443e1b18732fe434d134a7e8344e92befdfb9b514f6167660'
            'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40')
depends=(glibc)
makedepends=(nasm
diffutils gcc make patch) # base-devel
_so=libffmpeg.so
optdepends=(nwjs)
conflicts=(vivaldi{,-snapshot}-ffmpeg-codecs)
provides=("${conflicts[@]}")
prepare() {
  # List used funcs
  base64 -d ${_chromium}sigs.base64 | grep -oP '\bav[a-z0-9_]*(?=\s*\()' > sigs.txt
  echo -e "avformat_version\navutil_version\nff_h264_decode_init_vlc" >> sigs.txt # only for opera
  echo -e "{\nglobal:\n$(sed 's/$/;/' sigs.txt)\nlocal:\n*;\n};" > export.map
  
  cd FFmpeg-$_commit
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
  cd FFmpeg-$_commit
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
  install -Dm644 $_so "${pkgdir}"/usr/lib/${_so}.${_avcodec}
  ln -svf /usr/lib/${_so}.$_avcodec "$pkgdir"/usr/lib/${_so}
  install -Dvm644 replace-chromium-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
  install -d "${pkgdir}"/opt/vivaldi{,-snapshot}
  for _n in 7.5 7.6 7.7 7.8 7.9 8.0 ; do
    ln -svf /usr/lib/${_so}.${_avcodec} "$pkgdir"/opt/vivaldi/${_so}.$_n
    ln -svf /usr/lib/${_so}.${_avcodec} "$pkgdir"/opt/vivaldi-snapshot/${_so}.$_n
  done
}
