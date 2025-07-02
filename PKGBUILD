
pkgname=chromium-ffmpeg-codecs
_ffver=7.1.1
pkgver=${_ffver}.m136_119
pkgrel=4
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium-s (non vendored ${_so})"
arch=('x86_64')
url='https://ffmpeg.org/'
license=('LGPL2.1')
source=(${url}releases/ffmpeg-${_ffver}.tar.xz aom.patch
https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/main/0001-Add-av_stream_get_first_dts-for-Chromium.patch
off-other-ffmpeg.hook on-other-ffmpeg.install)
install=on-other-ffmpeg.install
sha256sums=('733984395e0dbbe5c046abda2dc49a5544e7e0e1e2366bba849222ae9e3a03b1'
            '0a4693424f173c4c4d0f1853189d1bd422dcc08f512cc33af3d2acf1e2483e8c'
            'f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40'
            'cb229264daa95c54396a215b9bd43561d1295ca24c0211777ce2c1a50c313b47'
            '9fe03a5e707a78bceb0ea9ebb8ad95c73f816bb52062701c17d1679df6667bdd')
depends=(glibc)
makedepends=(diffutils gcc make nasm patch sed)
optdepends=({electron{28..36},nwjs}': replace ffmpeg')
conflicts=(vivaldi-ffmpeg-codecs opera{,-developer,-beta}-ffmpeg-codecs{,-bin})
provides=("${conflicts[@]}")

prepare() {
  cd ffmpeg-$_ffver
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch
  patch -Np1 -i ../aom.patch
  # Use native opus not in kAllowedAudioCodecs
  sed -i '/^ *\.p\.name *=.*/c\.p.name="libopus",' libavcodec/opus/dec.c
}

build() {
  cd ffmpeg-$_ffver
  # Use part of https://chromium.googlesource.com/chromium/third_party/ffmpeg/+/refs/heads/master/chromium/config/Chrome/linux/x64/
  # Use some flags at https://chromium.googlesource.com/chromium/third_party/ffmpeg/+/refs/heads/master/BUILD.gn
  ./configure \
    --disable-{all,autodetect,programs,doc,iconv,network,symver} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-swresample \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,mp3,aac,h264 \
    --enable-parser=aac,flac,h264,mpegaudio,opus,vorbis,vp9 \
    --extra-cflags="-fno-math-errno -fno-signed-zeros ${LTOFLAGS}" \
    --prefix="${srcdir}"/release \
    --enable-{pic,asm,hardcoded-tables} # https://www.ffmpeg.org/platform.html#toc-Advanced-linking-configuration

  make install
  cd ../release
  gcc $LTOFLAGS -shared $LDFLAGS -Wl,--no-as-needed \
    -Wl,--whole-archive lib/lib{avcodec,avformat}.a \
    -Wl,--no-whole-archive lib/lib{avutil,swresample}.a -Wl,-u,avutil_version \
    -lm -Wl,-Bsymbolic -o $_so
}

package(){
  install -Dm644 release/$_so "${pkgdir}"/usr/lib/$_so
  #install -d "${pkgdir}"/opt/vivaldi
  #ln -sf /usr/lib/$_so "$pkgdir"/opt/vivaldi/${_so}.7.4
  # Opera has strange LD_PRELOAD
  install -Dm644 off-other-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
}
