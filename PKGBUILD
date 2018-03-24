# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: Daniel Bermond < yahoo-com: danielbermond >
# Contributor: rcpoison <rc dot poison at gmail dot com>
# Contributor: Gerad Munsch <gmunsch@unforgivendevelopment.com>
# Contributor: Rudolf Polzer <divVerent[at]xonotic[dot]org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

# If you don't want CUDA/CUVID support, you can remove
# depends_x86_64=('cuda') line and 
# $_cuda \, $_cuvid \, $_libnpp \ lines from PKGBUILD
#
# Add "--enable-decklink \" to configure flags
# if you have decklink-sdk installed
# Add "--enable-libndi_newtek \" to configure flags
# if you have ndi-sdk installed

pkgname=ffmpeg-full-nvenc
_pkgbasename=ffmpeg
pkgver=3.4.2
pkgrel=3
epoch=1
pkgdesc="Record, convert, and stream audio and video (all codecs including Nvidia NVENC)"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
license=('GPL' 'custom:UNREDISTRIBUTABLE')
depends=('alsa-lib' 'bzip2' 'celt' 'chromaprint-fftw' 'fontconfig' 'frei0r-plugins'
         'fribidi' 'glibc' 'gnutls' 'gsm' 'jack' 'kvazaar' 'ladspa' 'lame' 'libass' 
         'libavc1394' 'libbluray' 'libbs2b' 'libcaca' 'libcdio-paranoia' 'libdc1394'
         'libfdk-aac' 'libgme' 'libiec61883' 'libilbc' 'libmodplug' 'libomxil-bellagio'
         'libmysofa' 'libpulse' 'librsvg' 'libsoxr' 'libssh' 'libtheora' 'libva' 
         'libvdpau' 'libwebp' 'libxml2' 'libxv' 'mesa' 'ndi-sdk' 'openal' 'opencore-amr'
         'opencl-driver' 'opencl-icd-loader' 'openh264' 
         'openjpeg2' 'libopenmpt-svn' 'opus' 'rockchip-mpp' 'rubberband' 'rtmpdump'
         'sdl2' 'smbclient' 'speex' 'shine' 'tesseract' 'twolame' 'v4l-utils'
         'vid.stab' 'vo-amrwbenc' 'libxcb' 'xvidcore' 'xz' 'wavpack' 'zeromq' 'zimg'
         'zlib' 'zvbi' 'libvorbisenc.so' 'libvorbis.so' 'libvpx.so' 'libx264.so'
         'libx265.so' 'snappy' 'sndio' 'xavs')
depends_x86_64=('cuda' 'nvidia-utils')
makedepends=('flite' 'libmfx' 'libvdpau' 'nasm' 'opencl-headers' 'vmaf')
optdepends=('avxsynth-git: for Avisynth support'
            'blackmagic-decklink-sdk: for Blackmagic DeckLink support; need to add --enable-decklink option in this PKGBUILD')
optdepends_x86_64=('intel-media-sdk: for Intel QSV support (Experimental! See PKGBUILD of that package for additional info)')
conflicts=('ffmpeg' 'ffmpeg-full' 'ffmpeg-git' 'ffmpeg-full-git' 'ffmpeg-full-extra')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavresample.so' 'libavutil.so' 'libpostproc.so' 'libswresample.so'
          'libswscale.so' 'ffmpeg' 'qt-faststart')
source=(https://ffmpeg.org/releases/$_pkgbasename-$pkgver.tar.xz{,.asc}
        'ffmpeg-full-rkmpp-build-fix.patch'
        'ffmpeg-full-rkmpp-remove-stream-start.patch'
        'UNREDISTRIBUTABLE.txt')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')
sha256sums=('2b92e9578ef8b3e49eeab229e69305f5f4cbc1fdaa22e927fc7fca18acccd740'
            'SKIP'
            '142923fd02851343bfbfd31b201ba014dced8a8c8898373c72d71d30d59f5851'
            'cac8577126c3e49f8c915fa289f3f5aa624dc55f897b8b7a5613191bcfa9c097'
            'e0c1b126862072a71e18b9580a6b01afc76a54aa6e642d2c413ba0ac9d3010c4')

prepare() {
    cd "$_pkgbasename-$pkgver"
    patch -Np1 -i "${srcdir}/ffmpeg-full-rkmpp-build-fix.patch"
    patch -Np1 -i "${srcdir}/ffmpeg-full-rkmpp-remove-stream-start.patch"
}

build() {
  cd "$_pkgbasename-$pkgver"

  # Add x86_64 (opt)depends to the build
  if [ "$CARCH" = "x86_64" ]
  then
      local _cuda='--enable-cuda'
      local _cudasdk='--enable-cuda-sdk'
      local _cuvid='--enable-cuvid'
      local _libnpp='--enable-libnpp'
      local _cflags='-I/opt/cuda/include'      
      # '-L/usr/lib/nvidia' (for cuda_sdk) needs to be enabled only on
      # systems with nvidia-340xx-utils or nvidia-304xx-utils
      if pacman -Qqs '^nvidia-340xx-utils$' | grep -q '^nvidia-340xx-utils$' ||
         pacman -Qqs '^nvidia-304xx-utils$' | grep -q '^nvidia-304xx-utils$'
      then
          local _nvidia_340xx_ldflags='-L/usr/lib/nvidia'
      fi
      local _ldflags="-L/opt/cuda/lib64 ${_nvidia_340xx_ldflags}"
      local _ldflags="${_ldflags} -Wl,-rpath -Wl,/opt/intel/mediasdk/lib64:/opt/intel/mediasdk/plugins"
      
      # strictly specifying nvcc path is needed if package is installing
      # cuda for the first time (nvcc path will be in $PATH only after relogin)
      sed -i "s@^nvcc_default=.*@nvcc_default='/opt/cuda/bin/nvcc'@" configure
  fi

  msg "Starting configure..."

  ## Add "--enable-decklink \" 
  ## if you have decklink-sdk installed
  ./configure \
    --prefix=/usr \
    --extra-cflags="${_cflags}" \
    --extra-ldflags="${_ldflags}" \
    \
    --toolchain=hardened \
    \
    --disable-rpath \
    --enable-gpl \
    --enable-version3 \
    --enable-nonfree \
    --disable-static \
    --enable-shared \
    --enable-avresample \
    \
    \
    $_cuda \
    $_cudasdk \
    $_cuvid \
    $_libnpp \
    \
    --enable-libdrm \
    --enable-libmfx \
    --enable-nvenc \
    --enable-omx \
    --enable-omx-rpi \
    \
    \
    --enable-alsa \
    --enable-avisynth \
    --enable-chromaprint \
    --enable-decoder=atrac3 \
    --enable-decoder=atrac3p \
    --enable-bzlib \
    --enable-fontconfig \
    --enable-frei0r \
    --enable-gnutls \
    --enable-gpl \
    --enable-gray \
    --enable-iconv \
    --enable-jack \
    --enable-ladspa \
    --enable-libass \
    --enable-libbluray \
    --enable-libbs2b \
    --enable-libcaca \
    --enable-libcdio \
    --enable-libcelt \
    --enable-libdc1394 \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgme \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libilbc \
    --enable-libkvazaar \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libmysofa \
    --enable-libndi_newtek \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --disable-libopencv \
    --enable-libopenh264 \
    --enable-libopenjpeg \
    --enable-libopenmpt \
    --enable-libopus \
    --enable-libpulse \
    --enable-librsvg \
    --enable-librubberband \
    --enable-librtmp  \
    --enable-libshine \
    --enable-libsmbclient \
    --enable-libsnappy \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libssh \
    --enable-libtesseract \
    --enable-libtheora \
    --enable-libtwolame \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvmaf \
    --enable-libvo-amrwbenc \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwavpack \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxavs \
    --enable-libxcb \
    --enable-libxcb-shm \
    --enable-libxcb-xfixes \
    --enable-libxcb-shape \
    --enable-libxvid \
    --enable-libxml2 \
    --enable-libzimg \
    --enable-libzmq \
    --enable-libzvbi \
    --enable-lzma \
    --enable-openal \
    --enable-opencl \
    --enable-opengl \
    --enable-openssl \
    --enable-rkmpp \
    --enable-sndio \
    --enable-sdl2 \
    --enable-vaapi \
    --enable-vdpau \
    --enable-xlib \
    --enable-zlib

    
  msg "Starting make"
  make
  make tools/qt-faststart
  make doc/ff{mpeg,play,server}.1
}

package() {
  cd "$_pkgbasename-$pkgver"
  make DESTDIR="$pkgdir" install install-man
  install -Dm 755 tools/qt-faststart "${pkgdir}"/usr/bin/
  install -Dm 644 "$srcdir"/UNREDISTRIBUTABLE.txt "$pkgdir/usr/share/licenses/$pkgname/UNREDISTRIBUTABLE.txt"
}
