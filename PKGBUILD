# Maintainer : eggz
pkgname=ffmpeg-nocuda
pkgver=5.0.1
gitver=n${pkgver}
pkgrel=3
pkgdesc='Complete solution to record, convert and stream audio and video (without nvidias propriatary blobs)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('GPL3')
depends=(
    'alsa-lib'
    'aom'
    'bzip2'
    'fontconfig'
    'fribidi'
    'gmp'
    'gnutls'
    'gsm'
    'jack'
    'lame'
    'libass.so'
    'libavc1394'
    'libbluray.so'
    'libdav1d.so'
    'libdrm'
    'libfreetype.so'
    'libiec61883'
    'libmfx'
    'libmodplug'
    'libomxil-bellagio'
    'libpulse'
    'librav1e.so'
    'libraw1394'
    'libsoxr'
    'libssh'
    'libtheora'
    'libva.so'
    'libva-drm.so'
    'libva-x11.so'
    'libvdpau'
    'libvidstab.so'
    'libvorbisenc.so'
    'libvorbis.so'
    'libvpx.so'
    'libwebp'
    'libx11'
    'libx264.so'
    'libx265.so'
    'libxcb'
    'libxext'
    'libxml2'
    'libxv'
    'libxvidcore.so'
    'opencore-amr'
    'openjpeg2'
    'opus'
    'sdl2'
    'speex'
    'srt'
    'v4l-utils'
    'vmaf'
    'xz'
    'zlib'

)
makedepends=('git' 'avisynthplus' 'ffnvcodec-headers' 'ladspa' 'nasm' 'srt')
optdepends=('avisynthplus: for reading AviSynth scripts as input'
            'intel-media-sdk: for Intel Quick Sync Video'
            'ladspa: for LADSPA filters'
            'nvidia-utils: Nvidia NVDEC/NVENC support')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswresample.so' 'libswscale.so'
          'ffmpeg')
conflicts=('ffmpeg')
source=("git+https://git.ffmpeg.org/ffmpeg.git#tag=$gitver"
	010-ffmpeg-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch
        030-ffmpeg-Add-ability-for-ffmpeg-to-run-svt-vp9.patch
	040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch
	050-ffmpeg-vmaf-2.x.patch
)
sha256sums=('SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)

prepare() {
 cd ${srcdir}/ffmpeg
 while read patch; do
  if [ "$patch" == "" ]; then
    continue
  fi

  msg2 "Patching gitsource"
  echo "Applying $patch"
  #git apply $patch || exit 2
  patch -Np1 -i $patch
 done <<< $(ls ../*.patch 2> /dev/null)
}

build() {
    cd ${srcdir}/ffmpeg 
    
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
        --disable-debug \
        --disable-static \
        --disable-stripping \
        --disable-hwaccel=cuda \
	--disable-nvdec \
	--disable-nvenc \
        --enable-avisynth \
        --enable-fontconfig \
        --enable-gmp \
        --enable-gnutls \
        --enable-gpl \
        --enable-ladspa \
        --enable-libaom \
        --enable-libass \
        --enable-libbluray \
        --enable-libdav1d \
        --enable-libdrm \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libgsm \
        --enable-libiec61883 \
        --enable-libjack \
        --enable-libmfx \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore_amrnb \
        --enable-libopencore_amrwb \
        --enable-libopenjpeg \
        --enable-libopus \
        --enable-libpulse \
        --enable-librav1e \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
        --enable-libtheora \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvmaf \
        --enable-libvorbis \
        --enable-libvpx \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxcb \
        --enable-libxml2 \
        --enable-libxvid \
        --enable-omx \
        --enable-shared \
        --enable-version3
    make
    make tools/qt-faststart
}

package() {
    make -C ffmpeg DESTDIR="$pkgdir" install
    install -D -m755 ffmpeg/tools/qt-faststart -t "${pkgdir}/usr/bin"
}
