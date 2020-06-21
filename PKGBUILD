# Maintainer: Arley Henostroza < arllk at gmail dot com >
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_svt_hevc_ver='1.4.3'

pkgname=ffmpeg-intel-full-git
pkgver=4.4.r98276.gfdac3c80ac
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features for intel; git version) (based on dbermond package)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('custom: nonfree and unredistributable')
depends=(
    # official repositories:
        'alsa-lib' 'jack'
        'bzip2' 'frei0r-plugins' 'libgcrypt' 'gmp' 'gnutls' 'ladspa' 'libass' 'aom'
        'aribb24' 'libbluray' 'libbs2b' 'libcaca' 'celt' 'libcdio-paranoia' 'codec2'
        'dav1d' 'libdc1394' 'libavc1394' 'libfdk-aac' 'fontconfig' 'freetype2' 'fribidi'
        'libgme' 'gsm' 'libilbc' 'libiec61883' 'kvazaar' 'lensfun' 'libmodplug' 'lame'
        'opencore-amr' 'openjpeg2' 'opus' 'pulseaudio' 'librsvg' 'rubberband' 'rtmpdump'
        'snappy' 'libsoxr' 'speex' 'srt' 'libssh' 'tensorflow' 'tesseract' 'libtheora'
        'twolame' 'v4l-utils' 'vid.stab' 'libvorbis' 'libvpx' 'wavpack' 'libwebp'
        'x264'  'x265' 'libxcb' 'xvidcore' 'libxml2' 'zimg' 'zeromq' 'zvbi' 'lv2'
        'lilv' 'xz' 'libmysofa' 'openal' 'ocl-icd' 'libgl' 'sndio' 'sdl2' 'vapoursynth'
        'libxv' 'libx11'  'libxext' 'zlib' 'libomxil-bellagio' 'libdrm' 'vmaf'
        'intel-media-sdk' 'libva' 'libvdpau' 'svt-hevc'
        'glslang' 'librabbitmq-c' 'vulkan-icd-loader'
    # AUR:
        'chromaprint-fftw' 'davs2' 'flite1-patched' 'libklvanc-git' 'openh264'
        'libopenmpt-svn' 'rav1e' 'shine' 'vo-amrwbenc' 'xavs' 'xavs2' 'pocketsphinx'
        'avisynthplus'
)
makedepends=(
    # official repositories:
        'git' 'nasm' 'opencl-headers' 'vulkan-headers' 'clang'
    # AUR:
        'decklink-sdk'
)
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libavresample.so' 'libswscale.so'
          'libswresample.so' 'ffmpeg' 'ffmpeg-full' 'ffmpeg-git' 'ffmpeg-intel')
conflicts=('ffmpeg')
source=('git+https://git.ffmpeg.org/ffmpeg.git'
        # Removed 010 because is for AMD
        "020-ffmpeg-add-svt-hevc-${_svt_hevc_ver}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/v${_svt_hevc_ver}/ffmpeg_plugin/0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
        "030-ffmpeg-add-svt-hevc-docs-${_svt_hevc_ver}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/v${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        'LICENSE')
sha256sums=('SKIP'
            '878757eb6d7072521caaeb71f1453ec3fc0f91a12936ef302e1625184787c6a6'
            '1499e419dda72b1604dc5e3959668f3843292ff56bfba78734e31510ba576de0'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')

prepare() {
    rm -f ffmpeg/libavcodec/libsvt_{hevc,av1}.c
    # AMD specific patch -d ffmpeg -Np1 -i "${srcdir}/010-ffmpeg-fix-vmaf-model-path.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-${_svt_hevc_ver}.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/030-ffmpeg-add-svt-hevc-docs-${_svt_hevc_ver}.patch"
}

pkgver() {
    local _version
    local _revision
    local _shorthash
    _version="$(git -C ffmpeg describe  --tags --long | awk -F'-' '{ sub(/^n/, "", $1); print $1 }')"
    _revision="$(git -C ffmpeg describe  --tags --match 'N' | awk -F'-' '{ print $2 }')"
    _shorthash="$(git -C ffmpeg rev-parse --short HEAD)"
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd ffmpeg
     
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
        --extra-cflags='-I/usr/include/tensorflow' \
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
        --enable-libaribb24 \
        --enable-libass \
        --enable-libbluray \
        --enable-libbs2b \
        --enable-libcaca \
        --enable-libcelt \
        --enable-libcdio \
        --enable-libcodec2 \
        --enable-libdav1d \
        --enable-libdavs2 \
        --enable-libdc1394 \
        --enable-libfdk-aac \
        --enable-libflite \
        --enable-fontconfig \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libglslang \
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
        --enable-librabbitmq \
        --enable-librav1e \
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
        --enable-libtensorflow \
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
        --disable-mbedtls \
        --enable-libmysofa \
        --enable-openal \
        --enable-opencl \
        --enable-opengl \
        --disable-openssl \
        --enable-pocketsphinx \
        --enable-sndio \
        --enable-sdl2 \
        --enable-vapoursynth \
        --enable-vulkan \
        --enable-xlib \
        --enable-zlib \
        \
        --enable-libdrm \
        --enable-libmfx \
        --enable-omx \
        --enable-v4l2-m2m \
        --enable-vaapi \
        --enable-vdpau
        
    make
    make tools/qt-faststart
}

package() {
    make -C ffmpeg DESTDIR="$pkgdir" install
    install -D -m755 ffmpeg/tools/qt-faststart -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
