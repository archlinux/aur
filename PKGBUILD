# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

_svt_hevc_ver='1.3.0'
_svt_av1_ver='0.6.0'
_svt_vp9_ver='ce245894c6fc1c5d1439c41a7dda8d6dc61784c4'

pkgname=ffmpeg-full
_srcname=ffmpeg
pkgver=4.1.3
pkgrel=7
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features including nvenc, qsv and libfdk-aac)'
arch=('i686' 'x86_64')
url='https://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=(
    # official repositories:
        'glibc' 'alsa-lib' 'jack' 'libpng'
        'bzip2' 'frei0r-plugins' 'libgcrypt' 'gmp' 'gnutls' 'ladspa' 'libass' 'aom'
        'libbluray' 'libbs2b' 'libcaca' 'celt' 'libcdio-paranoia' 'libdc1394'
        'libavc1394' 'libfdk-aac' 'fontconfig' 'freetype2' 'fribidi' 'libgme' 'gsm'
        'libiec61883' 'lensfun' 'libmodplug' 'lame' 'opencore-amr' 'openjpeg2' 'opus'
        'pulseaudio' 'librsvg' 'rubberband' 'rtmpdump' 'snappy' 'libsoxr'
        'speex' 'srt' 'libssh' 'tensorflow' 'tesseract' 'libtheora' 'twolame'
        'v4l-utils' 'vid.stab' 'libvorbis' 'libvpx' 'wavpack' 'libwebp' 'libx264.so'
        'x265' 'libxcb' 'xvidcore' 'libxml2' 'zimg' 'zeromq' 'zvbi' 'lv2' 'lilv' 'xz'
        'openal' 'ocl-icd' 'libgl' 'sndio' 'sdl2' 'vapoursynth' 'libxv' 'libx11'
        'libxext' 'zlib' 'libomxil-bellagio' 'libva' 'libdrm' 'libvdpau'
    # AUR:
        'chromaprint-fftw' 'codec2' 'davs2' 'flite1-patched' 'libilbc' 'libklvanc-git'
        'kvazaar' 'openh264' 'libopenmpt-svn' 'shine' 'vo-amrwbenc' 'xavs' 'xavs2'
        'ndi-sdk' 'libmysofa' 'rockchip-mpp'
)
depends_x86_64=(
    # official repositories:
        'cuda'
    # AUR:
        'intel-svt-hevc' 'intel-svt-av1' 'svt-vp9-git' 'intel-media-sdk'
)
makedepends=(
    # official repositories:
        'nasm' 'opencl-headers' 'ffnvcodec-headers'
    # AUR:
        'blackmagic-decklink-sdk'
)
makedepends_x86_64=(
    # AUR:
        'vmaf'
)
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libavresample.so' 'libswscale.so'
          'libswresample.so' 'ffmpeg')
conflicts=('ffmpeg')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"{,.asc}
        'ffmpeg-full-decklink-sdk-11.patch'
        'LICENSE')
source_x86_64=("ffmpeg-full-add-intel-svt-hevc-${_svt_hevc_ver}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/v${_svt_hevc_ver}/ffmpeg_plugin/0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
               "ffmpeg-full-add-intel-svt-hevc-docs-${_svt_hevc_ver}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/v${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
               "ffmpeg-full-add-intel-svt-av1-${_svt_av1_ver}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-AV1/v${_svt_av1_ver}/ffmpeg_plugin/0001-Add-ability-for-ffmpeg-to-run-svt-av1-with-svt-hevc.patch"
               "ffmpeg-full-add-intel-svt-vp9-g${_svt_vp9_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/${_svt_vp9_ver}/ffmpeg_plugin/0001-Add-ability-for-ffmpeg-to-run-svt-vp9-with-svt-hevc-av1.patch")
sha256sums=('0c3020452880581a8face91595b239198078645e7d7184273b8bcc7758beb63d'
            'SKIP'
            '96500257c72c664a9e7417d9aee3d0b2a4436f836e9733dcf1c9c30926b642df'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')
sha256sums_x86_64=('cc8ba4ff56cdb38a59650203999c4c8c83fc40bdb905b87b678ff68a4538444d'
                   '516c5a1b3ab6dc444e2270a1bae90455838fc3b7e3a18de37d7d63e25e79493d'
                   '102a70c5c453875f5806ce02cc83fdc74e53c078cf5be2657f3dd1dd4438868c'
                   '7690a4f6bdc4a57e35c7ff5b6e87f2fe6d056d452eff9e767eaccff41832f4d7')
validpgpkeys=('FCF986EA15E6E293A5644F10B4322F04D67658D8')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    # add intel-svt support for hevc, av1 and vp9
    if [ "$CARCH" = 'x86_64' ] 
    then
        patch -Np1 -i "${srcdir}/ffmpeg-full-add-intel-svt-hevc-${_svt_hevc_ver}.patch"
        patch -Np1 -i "${srcdir}/ffmpeg-full-add-intel-svt-hevc-docs-${_svt_hevc_ver}.patch"
        patch -Np1 -i "${srcdir}/ffmpeg-full-add-intel-svt-av1-${_svt_av1_ver}.patch"
        patch -Np1 -i "${srcdir}/ffmpeg-full-add-intel-svt-vp9-g${_svt_vp9_ver:0:7}.patch"
    fi
    
    # fix build with decklink sdk 11
    patch -Np1 -i "${srcdir}/ffmpeg-full-decklink-sdk-11.patch"
}

build() {
    cd "${_srcname}-${pkgver}"
    
    # set x86_64 specific options
    if [ "$CARCH" = 'x86_64' ] 
    then
        local _libvmaf='--enable-libvmaf'
        local _cudasdk='--enable-cuda-sdk'
        local _libmfx='--enable-libmfx'
        local _libnpp='--enable-libnpp'
        
        local _cflags='-I/opt/cuda/include'
        local _ldflags='-L/opt/cuda/lib64'
        
        export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+${PKG_CONFIG_PATH}:}/opt/intel/mediasdk/lib64/pkgconfig"
        
        # set path of -lcuda (libcuda.so.x, required by cuda_sdk)
        # on systems with legacy nvidia drivers
        if pacman -Qs '^nvidia-340xx-utils' >/dev/null 2>&1
        then
            _ldflags+=' -L/usr/lib/nvidia'
        fi
    fi
    
    # fix tensorflow include dir
    ## upstream ffmpeg excects : /usr/include/tensorflow/
    ## tensorflow package ships: /usr/include/tensorflow/tensorflow/
    _cflags+=' -I/usr/include/tensorflow'
    
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
        --extra-cflags="$_cflags" \
        --extra-ldflags="$_ldflags" \
        \
        --disable-rpath \
        --enable-gpl \
        --enable-version3 \
        --enable-nonfree \
        --enable-shared \
        --disable-static \
        --disable-stripping \
        --enable-gray \
        --enable-avresample \
        \
        --enable-alsa \
        --enable-avisynth \
        --enable-bzlib \
        --enable-chromaprint \
        --enable-frei0r \
        --enable-gcrypt \
        --enable-gmp \
        --enable-gnutls \
        --enable-iconv \
        --enable-ladspa \
        --enable-libaom \
        --enable-libass \
        --enable-libbluray \
        --enable-libbs2b \
        --enable-libcaca \
        --enable-libcelt \
        --enable-libcdio \
        --enable-libcodec2 \
        --enable-libdavs2 \
        --enable-libdc1394 \
        --enable-libfdk-aac \
        --enable-libflite \
        --enable-fontconfig \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libgme \
        --enable-libgsm \
        --enable-libiec61883 \
        --enable-libilbc \
        --enable-libjack \
        --enable-libklvanc \
        --enable-libkvazaar \
        --enable-liblensfun \
        --enable-libmodplug \
        --enable-libmp3lame \
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
        --disable-libsmbclient \
        --enable-libsnappy \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
        --enable-libsvthevc \
        --enable-libsvtav1 \
        --enable-libsvtvp9 \
        --enable-libtensorflow \
        --enable-libtesseract \
        --enable-libtheora \
        --disable-libtls \
        --enable-libtwolame \
        --enable-libv4l2 \
        --enable-libvidstab \
        $_libvmaf \
        --enable-libvo-amrwbenc \
        --enable-libvorbis \
        --enable-libvpx \
        --enable-libwavpack \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxavs \
        --enable-libxavs2 \
        --enable-libxcb \
        --enable-libxcb-shm \
        --enable-libxcb-xfixes \
        --enable-libxcb-shape \
        --enable-libxvid \
        --enable-libxml2 \
        --enable-libzimg \
        --enable-libzmq \
        --enable-libzvbi \
        --enable-lv2 \
        --enable-lzma \
        --enable-decklink \
        --enable-libndi_newtek \
        --enable-libmysofa \
        --enable-openal \
        --enable-opencl \
        --enable-opengl \
        --disable-openssl \
        --enable-sndio \
        --enable-sdl2 \
        --enable-vapoursynth \
        --enable-xlib \
        --enable-zlib \
        \
        $_cudasdk \
        --enable-cuvid \
        --enable-ffnvcodec \
        --enable-libdrm \
        $_libmfx \
        $_libnpp \
        --enable-nvdec \
        --enable-nvenc \
        --enable-omx \
        --enable-omx-rpi \
        --enable-rkmpp \
        --enable-v4l2-m2m \
        --enable-vaapi \
        --enable-vdpau
        
    make
    make tools/qt-faststart
}

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m755 tools/qt-faststart  -t "${pkgdir}/usr/bin"
    install -D -m644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
