
pkgname=chromium-ffmpeg-codecs-git
pkgver=7.2.r119684.g670089304a
pkgrel=5
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium M138+ (non vendored ffmpeg)"
arch=('x86_64')
url='https://git.ffmpeg.org/ffmpeg'
license=('LGPL-2.1-or-later')
source=(https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/main/0001-Add-av_stream_get_first_dts-for-Chromium.patch)
sha256sums=('f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40')
depends=(glibc)
makedepends=(nasm git)
conflicts=(vivaldi{,-snapshot}-ffmpeg-codecs)
provides=("${conflicts[@]}")

prepare() {
  rm -rf ffmpeg
  git clone --depth=1 ${url}
  cd ffmpeg
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch
  # Use native opus decoder not in kAllowedAudioCodecs
  # needs swresample
  sed -i '/^ *\.p\.name *=.*/c\.p.name="libopus",' libavcodec/opus/dec.c
}

build() {
  cd ffmpeg
  # https://chromium.googlesource.com/chromium/third_party/ffmpeg/+/refs/heads/master/
  # chromium/config/Chrome/linux/x64/ BUILD.gn
  ./configure \
    --disable-{all,autodetect,doc,iconv,network,symver} \
    --disable-{error-resilience,faan,iamf} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-swresample \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,opus,flac,pcm_s16le,mp3,aac,h264 \
    --enable-parser=aac,flac,h264,mpegaudio,opus,vorbis,vp9 \
    --extra-cflags="-fno-math-errno -fno-signed-zeros ${LTOFLAGS}" \
    --prefix="${srcdir}"/release \
    --enable-{pic,asm,hardcoded-tables}

  make install
  cd ../release
  gcc $LTOFLAGS -shared $LDFLAGS \
    -Wl,--whole-archive lib/lib{avcodec,avformat}.a \
    -Wl,--no-whole-archive lib/lib{avutil,swresample}.a \
    -lm -Wl,-Bsymbolic -o $_so
}

package(){
  install -Dm644 release/$_so "${pkgdir}"/usr/lib/${pkgname}/$_so
  install -d "${pkgdir}"/opt/vivaldi{,-snapshot}
  for n in 7.5 7.6 7.7 7.8 7.9 8.0; do
    ln -svf /usr/lib/${pkgname}/$_so "$pkgdir"/opt/vivaldi/${_so}.$n
    ln -svf /usr/lib/${pkgname}/$_so "$pkgdir"/opt/vivaldi-snapshot/${_so}.$n
  done
}
