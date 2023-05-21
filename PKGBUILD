#!/bin/bash
# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: Arley Henostroza <arllk10@gmail.com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

_svt_hevc_ver='6cca5b932623d3a1953b165ae6b093ca1325ac44'

pkgname=ffmpeg-intel-full-git
pkgver=6.1.r110700.ge684967e74
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
        'libgme' 'gsm' 'libilbc' 'libiec61883' 'kvazaar' 'lensfun-git' 'libmodplug' 'lame'
        'opencore-amr' 'openjpeg2' 'opus' 'libpulse' 'librsvg' 'rubberband' 'rtmpdump'
        'snappy' 'libsoxr' 'speex' 'srt' 'libssh' 'tesseract' 'libtheora' 'uavs3d-git'
        'twolame' 'smbclient' 'v4l-utils' 'vid.stab' 'libvorbis' 'libvpx' 'libwebp'
        'x264'  'x265' 'libxcb' 'xvidcore' 'libxml2' 'zimg' 'zeromq' 'zvbi' 'lv2'
        'lilv' 'xz' 'libmysofa' 'openal' 'ocl-icd' 'libgl' 'sndio' 'sdl2' 'vapoursynth'
        'libxv' 'libx11'  'libxext' 'zlib' 'libomxil-bellagio' 'libdrm'
        'intel-media-sdk' 'libva' 'libvdpau' 'svt-hevc' 'srt' 'vmaf' 
        'glslang' 'librabbitmq-c' 'vulkan-icd-loader' 'svt-av1' 'svt-vp9' 'spirv-tools' 'librist'
    # AUR:
        'chromaprint-fftw' 'davs2' 'flite1-patched' 'libklvanc-git' 'openh264'
        'libopenmpt' 'rav1e' 'shine' 'vo-amrwbenc' 'xavs' 'xavs2'
        'avisynthplus'
)
optdepends=(
       #'pocketsphinx: Speech recognition support'
       #'tensorflow: Tensorflow support in ffmpeg filters' # blocked on FS#72145 : https://bugs.archlinux.org/task/72145
)
makedepends=(
    # official repositories:
        'git' 'nasm' 'opencl-headers' 'vulkan-headers' 'clang' 'pkg-config'
    # AUR:
        'decklink-sdk'
)
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswscale.so'
          'libswresample.so' 'ffmpeg' 'ffmpeg-full' 'ffmpeg-git' 'ffmpeg-intel')
conflicts=('ffmpeg')
source=('git+https://git.ffmpeg.org/ffmpeg.git'
        '000-OwO-whats-this.patch'
        "010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/master-0001-lavc-svt_hevc-add-libsvt-hevc-encoder-wrapper.patch"
        "020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        "030-ffmpeg-add-svt-vp9.patch"
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
        '050-ffmpeg-pocketsphinx-arch.patch'
        'LICENSE')

b2sums=('SKIP'
        '5941f3be231a8d6c4fd6070d410bf6e8e1e1f10a2b60ab172db23b96ef809cc446ed6b1a477e80bbb26fe506d720d105b64b0b390003bc8215ee0bf2bbe7521e'
        '5e04d2ce4e7ffaf7b5d3ff573967f9f42d55021b170ae46a13f615b0b702a4827dc05a511909050dc489205a3d166e83edfd4195923cea4a6524d88fa4c70d08'
        'e611b388d6b62adeb1b0d0afd7606955d6452e70a37a4e0a955068f46beb313fd6f1c6b696273441390ae31de47a5bcb0bf2fc97e208dae1c1fa7a145f808c61'
        '170f7db4f24747fbddfc1910fb26b9c3ad8165f40753f710ed51f934ef5c26a2bbdb40bc62b3167954c24a16fe4be370fa9564ef6866125c3235ee6a3fc94790'
        '3f2ee7606500fa9444380d138959cd2bccfbba7d34629a17f4f6288c6bde29e931bbe922a7c25d861f057ddd4ba0b095bbd675c1930754746d5dd476b3ccbc13'
        '7a9c12a8aeeaf018785cd583166413d67d2121894eabdb2542000690d3720e38ef4f3a5b412f6f8ebb3d584bbd728168487510d6ffc9cab1fb7f8548d6ae20bf'
        '9e26a2e62682b86449496bbdef7e4ace46d407e369d6f64013093af9098f5944b11e00670a1e652550281bdb7d8be70235bbf986c58d4f9fd32c0216116d7abf')

prepare() {
    rm -f ffmpeg/libavcodec/libsvt_{hevc,vp9}.c
    patch -d ffmpeg -Np1 -F2 -i "${srcdir}/000-OwO-whats-this.patch"
    patch -d ffmpeg -Np1 -F2 -i "${srcdir}/010-ffmpeg-add-svt-hevc-g${_svt_hevc_ver:0:7}.patch"
    patch -d ffmpeg -Np1 -F2 -i "${srcdir}/020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -d ffmpeg -Np1 -F3 -i "${srcdir}/030-ffmpeg-add-svt-vp9.patch"
    patch -d ffmpeg -Np1 -F3 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    # ffmpeg is as yet incompatible with pocketsphinx 5.0.
    # Let me know if this changes.
    # libavfilter/af_asr.c:42:5: error: unknown type name ‘cmd_ln_t’ (etc)
    #patch -d ffmpeg -Np1 -F3 -i "${srcdir}/050-ffmpeg-pocketsphinx-arch.patch"
}

pkgver() {
    printf '%s.r%s.g%s' "$(git -C ffmpeg describe --tags --long | awk -F'-' '{ sub(/^n/, "", $1); print $1 }')" \
                        "$(git -C ffmpeg describe --tags --match 'N' | awk -F'-' '{ print $2 }')" \
                        "$(git -C ffmpeg rev-parse --short HEAD)"
}

build() {
    cd ffmpeg
    EXTRA_FLAGS=()
     
    printf '%s\n' '  -> Running ffmpeg configure script...'
    #pacman -Qk pocketsphinx && EXTRA_FLAGS+=( --enable-pocketsphinx ) || true

    ./configure \
        --prefix='/usr' \
        \
        --disable-rpath \
        --enable-gpl \
        --enable-version3 \
        --enable-nonfree \
        --enable-shared \
        --disable-static \
        --disable-stripping \
        --enable-gray \
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
        --enable-libsvtav1 \
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
        --enable-libsmbclient \
        --enable-libsnappy \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
        --enable-libsvthevc \
	--enable-libsvtav1 \
        --disable-libtensorflow \
        --enable-libtesseract \
        --enable-libtheora \
        --disable-libtls \
        --enable-libtwolame \
        --enable-libuavs3d \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvmaf \
        --enable-libvo-amrwbenc \
        --enable-libvorbis \
        --enable-libvpx \
	--enable-libsvtvp9 \
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
        --disable-pocketsphinx \
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
        --enable-vdpau \
	$EXTRA_FLAGS
        
    make
    make tools/qt-faststart
}

package() {
    make -C ffmpeg DESTDIR="$pkgdir" install
    install -D -m755 ffmpeg/tools/qt-faststart -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: syntax=bash et ts=4 sw=4
