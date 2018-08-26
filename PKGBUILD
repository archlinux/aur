# Maintainer: Marc Boocha < marcboocha@gmail.com >
# Contributor: Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>

pkgname=ffmpeg-full-nodecklink
_srcname=ffmpeg
pkgver=4.0.2
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features including nvenc, qsv and libfdk-aac) except decklink'
arch=('i686' 'x86_64')
url='http://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=(
    # official repositories:
        'glibc' 'alsa-lib' 'jack' 'libpng'
        'bzip2' 'frei0r-plugins' 'libgcrypt' 'gmp' 'gnutls' 'ladspa' 'libass' 'aom'
        'libbluray' 'libbs2b' 'libcaca' 'celt' 'libcdio-paranoia' 'libdc1394'
        'libavc1394' 'libfdk-aac' 'fontconfig' 'freetype2' 'fribidi' 'libgme' 'gsm'
        'libiec61883' 'libmodplug' 'lame' 'opencore-amr' 'openjpeg2' 'opus' 'pulseaudio'
        'librsvg' 'rubberband' 'rtmpdump' 'smbclient' 'snappy' 'libsoxr' 'speex' 'srt'
        'libssh' 'tesseract' 'libtheora' 'twolame' 'v4l-utils' 'vid.stab' 'libvorbis'
        'libvpx' 'wavpack' 'libwebp' 'libx264.so' 'x265' 'libxcb' 'xvidcore' 'libxml2'
        'zimg' 'zeromq' 'zvbi' 'lv2' 'lilv' 'xz' 'openal' 'ocl-icd' 'libgl' 'sndio'
        'sdl2' 'libxv' 'libx11' 'libxext' 'zlib' 'libomxil-bellagio' 'libva' 'libdrm'
        'libvdpau'
    # AUR:
        'chromaprint-fftw' 'codec2' 'flite1-patched' 'libilbc' 'kvazaar' 'openh264'
        'libopenmpt-svn' 'shine' 'vo-amrwbenc' 'xavs' 'ndi-sdk' 'libmysofa'
        'rockchip-mpp'
)
depends_x86_64=(
    # official repositories:
        'cuda'
    # AUR:
        'intel-media-sdk'
)
makedepends=(
    # official repositories:
        'nasm' 'opencl-headers' 'ffnvcodec-headers'
)

provides=(
    'ffmpeg' 'ffmpeg-full-nvenc' 'ffmpeg-full' 'ffmpeg-nvenc' 'ffmpeg-libfdk_aac'
    'qt-faststart' 'libavutil.so' 'libavcodec.so' 'libavformat.so' 'libavdevice.so'
    'libavfilter.so' 'libavresample.so' 'libswscale.so' 'libswresample.so'
    'libpostproc.so'
)
conflicts=(
    'ffmpeg' 'ffmpeg-full-nvenc' 'ffmpeg-full' 'ffmpeg-nvenc' 'ffmpeg-libfdk_aac'
    'ffmpeg-git' 'ffmpeg-full-git' 'ffmpeg-semifull-git' 'ffmpeg-qsv-git'
)
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz"
        'LICENSE')
sha256sums=('a95c0cc9eb990e94031d2183f2e6e444cc61c99f6f182d1575c433d62afb2f97'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    # strictly specifying nvcc path is needed if package is installing
    # cuda for the first time (nvcc path will be in $PATH only after relogin)
    sed -i "s|^nvcc_default=.*|nvcc_default='/opt/cuda/bin/nvcc'|" configure
}

build() {
    cd "${_srcname}-${pkgver}"
    
    # set x86_64 specific options
    if [ "$CARCH" = 'x86_64' ] 
    then
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
            _ldflags="${_ldflags} -L/usr/lib/nvidia"
        fi
    fi
    
    echo 'Running ffmpeg configure script. Please wait...'
    
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
        --enable-libkvazaar \
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
        --enable-libsmbclient \
        --enable-libsnappy \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
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
        --disable-decklink \
        --enable-libndi_newtek \
        --enable-libmysofa \
        --enable-openal \
        --enable-opencl \
        --enable-opengl \
        --disable-openssl \
        --enable-sndio \
        --enable-sdl2 \
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
