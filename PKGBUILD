
pkgname=chromium-ffmpeg-codecs
_ffver=7.1.1
pkgver=${_ffver}.m136_134 # update to m137_ at next rel
pkgrel=2 # drop at next rel
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium M137- (non vendored ffmpeg)"
arch=('x86_64')
url='https://ffmpeg.org/'
license=('LGPL-2.1-or-later')
source=(${url}releases/ffmpeg-${_ffver}.tar.xz
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/main/0001-Add-av_stream_get_first_dts-for-Chromium.patch
off-other-ffmpeg.hook on-other-ffmpeg.install)
install=on-other-ffmpeg.install
sha256sums=('733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1'
            'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40'
            '14db1605a740325737eb9ae029deb142d717a02c1926703b0d45f788c937d861'
            '0252a9cbf39bbbae2a27b1e929b62de0e69fa653ee691e9c310400fb02ea3598')
depends=(glibc)
makedepends=(nasm
diffutils gcc make sed) # base-devel
optdepends=({nwjs,slimjet}': replace ffmpeg')
conflicts=(opera{,-developer,-beta}-ffmpeg-codecs)
provides=(opera{,-developer,-beta}-ffmpeg-codecs)

prepare() {
  cd ffmpeg-$_ffver
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch
  # Use native opus not in kAllowedAudioCodecs
  sed -i.bak "s/^ *\.p\.name *=.*/.p.name=\"libopus\",/" libavcodec/opus/dec.c
  # diff libavcodec/opus/dec.c{.bak,} || :
  # Drop this at 7.1.2 # https://lists.ffmpeg.org/pipermail/ffmpeg-devel/2025-May/343409.html
  sed -i.bak  "s/h264_sei.o h2645_sei.o/h264_sei.o h2645_sei.o aom_film_grain.o/" libavcodec/Makefile
}

build() {
  cd ffmpeg-$_ffver
  # https://chromium.googlesource.com/chromium/third_party/ffmpeg/+/refs/heads/master/chromium/config/Chrome/linux/x64/
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
    --prefix="${srcdir}"/release \
    --enable-{pic,asm,hardcoded-tables}

  make install
  cd ../release
  gcc $LTOFLAGS -shared $LDFLAGS \
    -Wl,--whole-archive lib/lib{avcodec,avformat}.a \
    -Wl,--no-whole-archive lib/lib{avutil,swresample}.a -Wl,-u,avformat_version -Wl,-u,avutil_version \
    -lm -Wl,-Bsymbolic -o $_so
}

package(){
  install -Dm644 release/$_so "${pkgdir}"/usr/lib/$_so
  #install -d "${pkgdir}"/opt/vivaldi
  #ln -sf /usr/lib/$_so "$pkgdir"/opt/vivaldi/${_so}.7.5
  # Block LD_PRELOAD and use layout inconflicts with opera*
  install -Dm644 off-other-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
}
