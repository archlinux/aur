# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# To enable NewTek NDI (libndi), install the package 'ndi-sdk'
# and add '--enable-libndi_newtek' to the configure options.

pkgname=ffmpeg-full-git
pkgver=3.5.r89615.g0c9ab5ef9c
pkgrel=1
pkgdesc='Record, convert and stream audio and video (all possible features including nvenc, qsv and libfdk-aac; git version)'
arch=('i686' 'x86_64')
url='http://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=(
    # official repositories:
        'glibc' 'alsa-lib' 'jack' 'libpng'
        'bzip2' 'frei0r-plugins' 'libgcrypt' 'gmp' 'gnutls' 'ladspa' 'libass'
        'libbluray' 'libcaca' 'celt' 'libcdio-paranoia' 'libdc1394' 'libavc1394'
        'libfdk-aac' 'fontconfig' 'freetype2' 'fribidi' 'libgme' 'gsm' 'libiec61883'
        'libmodplug' 'lame' 'opencore-amr' 'opencv' 'openjpeg2' 'opus' 'pulseaudio'
        'librsvg' 'rubberband' 'rtmpdump' 'smbclient' 'snappy' 'libsoxr' 'speex'
        'libssh' 'tesseract' 'libtheora' 'twolame' 'v4l-utils' 'vid.stab' 'libvorbis'
        'libvpx' 'wavpack' 'libwebp' 'libx264.so' 'x265' 'libxcb' 'xvidcore' 'libxml2'
        'zeromq' 'zvbi' 'lilv' 'xz' 'openal' 'opencl-icd-loader' 'mesa' 'sdl2'
        'libx11' 'zlib' 'libomxil-bellagio' 'libva' 'libdrm' 'libvdpau'
    # AUR:
        'chromaprint-fftw' 'libbs2b' 'libilbc' 'kvazaar' 'openh264'
        'libopenmpt-svn' 'sndio' 'shine' 'vo-amrwbenc' 'xavs' 'zimg-git' 'libmysofa'
        'rockchip-mpp'
)
depends_x86_64=('cuda' 'nvidia-utils')
optdepends_x86_64=(
    # AUR:
        'intel-media-sdk: for Intel QSV support (experimental)'
)
makedepends=(
    # official repositories:
        'git' 'nasm' 'opencl-headers'
    # AUR:
        'blackmagic-decklink-sdk' 'libmfx' 'libvmaf-git'
)
provides=(
    'ffmpeg' 'qt-faststart' 'ffmpeg-git' 'ffmpeg-decklink' 'ffmpeg-libfdk_aac' 'ffmpeg-nvenc'
    'ffmpeg-qsv-git' 'ffmpeg-full' 'ffmpeg-full-nvenc' 'ffmpeg-semifull-git' 'libavutil.so'
    'libavcodec.so' 'libavformat.so' 'libavdevice.so' 'libavfilter.so' 'libavresample.so'
    'libswscale.so' 'libswresample.so' 'libpostproc.so'
)
conflicts=(
    'ffmpeg' 'ffmpeg-git' 'ffmpeg-decklink' 'ffmpeg-libfdk_aac' 'ffmpeg-nvenc'
    'ffmpeg-qsv-git' 'ffmpeg-full' 'ffmpeg-full-nvenc' 'ffmpeg-semifull-git'
)
source=("$pkgname"::'git://source.ffmpeg.org/ffmpeg.git'
        'LICENSE')
sha256sums=('SKIP'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')

pkgver() {
    cd "$pkgname"
    local _version="$(  git describe  --tags --long      | cut -d'-' -f1 | sed 's/^n//')"
    local _revision="$( git describe  --tags --match 'N' | cut -d'-' -f2)"
    local _shorthash="$(git rev-parse --short HEAD)"
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd "$pkgname"
    
    # set x86_64 specific options
    if [ "$CARCH" = 'x86_64' ] 
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
    
    msg2 'Running ffmpeg configure script. Please wait...'
    
    ./configure \
        --prefix='/usr' \
        --extra-cflags="${_cflags}" \
        --extra-ldflags="${_ldflags}" \
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
        --enable-libass \
        --enable-libbluray \
        --enable-libbs2b \
        --enable-libcaca \
        --enable-libcelt \
        --enable-libcdio \
        --enable-libdc1394 \
        --enable-libfdk-aac \
        --disable-libflite \
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
        --enable-libopencv \
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
        --disable-libtls \
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
        --enable-lv2 \
        --enable-lzma \
        --enable-decklink \
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
        $_cuda \
        $_cudasdk \
        $_cuvid \
        --enable-libdrm \
        --enable-libmfx \
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
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    
    install -D -m755 tools/qt-faststart  "${pkgdir}/usr/bin/qt-faststart"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
