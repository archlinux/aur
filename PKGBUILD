
pkgname=chromium-ffmpeg-codecs-git
_ver=7.1
pkgver=${_ver}.m136_119
pkgrel=1
_so=libffmpeg.so
pkgdesc="Add codecs to some Chromium-s (non vendored ${_so})"
arch=('x86_64')
url="https://git.ffmpeg.org/ffmpeg"
license=('GPL-3.0-or-later')
# Avoid conflicting by manual clone
source=(https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/raw/main/0001-Add-av_stream_get_first_dts-for-Chromium.patch
{off,on}-opera-bundled-ffmpeg.hook)
sha256sums=('f865d677f8ad39c79dde69186629cb6468c2b289c4156dbb8dec8e68b0131b40'
            '08bf8603cb7b1dfe69ca28b4843c29cc96fd1faf01b37f123f2194ac33ff47a4'
            '530e7a0c919c1cd9ae703b3c28a013556d93eb98f4968127581111ad7830aa3e')
depends=(glibc zlib opus)
makedepends=(gcc pkgconf diffutils nasm git
  patch
  sed
)
conflicts=(vivaldi-ffmpeg-codecs opera{,-developer,-beta}-ffmpeg-codecs{,-bin})
provides=("${conflicts[@]}")

prepare() {
  echo You need main branch for M138.
  rm -rf ffmpeg
  git clone --depth=1 ${url}.git --branch release/$_ver 
  cd ffmpeg
  patch -Np1 -i ../0001-Add-av_stream_get_first_dts-for-Chromium.patch
}

build() {
  cd ffmpeg
  # See https://github.com/chromium/chromium/blob/main/ and build subset of
  #  allowed_demuxers at media/filters/ffmpeg_glue.cc webm is subset of matroska
  #  kAllowedAudioCodecs at media/ffmpeg/ffmpeg_common.cc
  #  GetAllowedVideoDecoders at media/ffmpeg/ffmpeg_common.cc
  #  Allowed parser?
  # They are kept for long time. So $pkgname should be usable for any Chromiums...

  ./configure \
    --enable-gpl \
    --disable-{all,autodetect,programs,doc,iconv,network} \
    --enable-static --disable-shared \
    --enable-av{format,codec,util} \
    --enable-protocol=file \
    --enable-demuxer=ogg,matroska,webm,wav,flac,mp3,mov,aac \
    --enable-decoder=vorbis,libopus,flac,pcm_s16le,pcm_s24le,mp3,aac,h264 \
    --enable-parser=vorbis,flac,mp3,aac,opus,mov \
    --enable-libopus \
    --prefix="${srcdir}"/release \
    --enable-{pic,asm,lto} # https://www.ffmpeg.org/platform.html#toc-Advanced-linking-configuration

  make $MAKEFLAGS
  make install

  cd ../release
  gcc $LTOFLAGS -shared $LDFLAGS -Wl,--no-as-needed  \
    -Wl,--whole-archive \
      lib/lib{avcodec,avformat,avutil}.a \
    -Wl,--no-whole-archive \
    $(pkgconf --libs zlib opus) \
    -Wl,-Bsymbolic \
    -o $_so
}

package(){
  _name=chromium-ffmpeg
  install -Dm644 release/$_so "${pkgdir}"/usr/lib/$_so
  for p in "${pkgdir}"/usr/lib/opera{,-developer,-beta}/lib_extra
  do
    install -d "$p"
    ln -sf /usr/lib/$_so "$p"/$_so
  done
  install -d "${pkgdir}"/opt/vivaldi #{,-snapshot}
  for n in 7.4 7.5 7.6; do
    ln -sf /usr/lib/$_so "$pkgdir"/opt/vivaldi/${_so}.$n
    #ln -sf /usr/lib/$_so "$pkgdir"/opt/vivaldi-snapshot/${_so}.$n
  done
  # block strange preload
  install -Dm644 {off,on}-opera-bundled-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
}
