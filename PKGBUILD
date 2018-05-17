# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Iacopo Isimbaldi <isiachi@rhye.it>
# Contributor: Ben Widawsky <ben@bwidawsk.net>

pkgname=ffmpeg-qsv
_srcname=ffmpeg
pkgver=4.0
pkgrel=1
pkgdesc='Record, convert and stream audio and video (including qsv and libfdk-aac)'
arch=('i686' 'x86_64')
url='http://www.ffmpeg.org/'
license=('GPL3' 'custom: nonfree and unredistributable')
depends=(
	'glibc' 'alsa-lib' 'jack' 'libpng'
	'bzip2' 'frei0r-plugins' 'libgcrypt' 'gmp' 'gnutls' 'ladspa' 'libass'
	'libbluray' 'libbs2b' 'libcaca' 'celt' 'libcdio-paranoia' 'libdc1394'
	'libavc1394' 'libfdk-aac' 'fontconfig' 'freetype2' 'fribidi' 'libgme' 'gsm'
	'libiec61883' 'libmodplug' 'lame' 'opencore-amr' 'openjpeg2' 'opus' 'pulseaudio'
	'librsvg' 'rubberband' 'rtmpdump' 'smbclient' 'snappy' 'libsoxr' 'speex' 'srt'
	'libssh' 'tesseract' 'libtheora' 'twolame' 'v4l-utils' 'vid.stab' 'libvorbis'
	'libvpx' 'wavpack' 'libwebp' 'libx264.so' 'x265' 'libxcb' 'xvidcore' 'libxml2'
	'zimg' 'zeromq' 'zvbi' 'lilv' 'xz' 'openal' 'opencl-icd-loader' 'mesa' 'sndio'
	'sdl2' 'libxv' 'libx11' 'libxext' 'zlib' 'libomxil-bellagio' 'libva' 'libdrm'
	'libvdpau'
	'libfdk-aac' 'intel-media-sdk'
)
makedepends=('nasm' 'opencl-headers')
optdepends=('beignet: OpenCL implementation for Intel IvyBridge+ iGPUs')
provides=('ffmpeg' 'ffmpeg-libfdk_aac' 'qt-faststart' 'libavutil.so' 'libavcodec.so' 'libavformat.so' 'libavdevice.so' 'libavfilter.so' 'libavresample.so' 'libswscale.so' 'libswresample.so' 'libpostproc.so')
conflicts=(
    'ffmpeg' 'ffmpeg-full-nvenc' 'ffmpeg-nvenc' 'ffmpeg-libfdk_aac' 'ffmpeg-decklink'
    'ffmpeg-git' 'ffmpeg-full-git' 'ffmpeg-semifull-git' 'ffmpeg-qsv-git')
source=("https://ffmpeg.org/releases/ffmpeg-${pkgver}.tar.xz" 'LICENSE')
sha256sums=('ed945daf40b124e77a685893cc025d086f638bc703183460aff49508edb3a43f'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')

prepare() {
    cd "${_srcname}-${pkgver}"
}

build() {
    cd "${_srcname}-${pkgver}"

    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH:+${PKG_CONFIG_PATH}:}/opt/intel/mediasdk/lib64/pkgconfig"

    ./configure \
        --prefix='/usr' \
	--extra-libs='-lpthread' \
        --disable-debug \
        --disable-rpath \
        --enable-gpl \
        --enable-version3 \
        --enable-nonfree \
        --enable-shared \
        --disable-static \
        --enable-gray \
        --enable-avisynth \
        --enable-avresample \
	--enable-alsa \
        --enable-fontconfig \
        --enable-gmp \
        --enable-gnutls \
        --enable-iconv \
        --enable-ladspa \
        --enable-libass \
        --enable-libbluray \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libgsm \
        --enable-libiec61883 \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore_amrnb \
        --enable-libopencore_amrwb \
        --enable-libopenjpeg \
        --enable-libopus \
        --enable-libpulse \
        --enable-libsoxr \
        --enable-libspeex \
	--enable-libsrt \
        --enable-libssh \
	--enable-librsvg \
	--enable-librtmp  \
	--enable-libsmbclient \
        --enable-libtheora \
	--disable-libtls \
	--enable-libtwolame \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvorbis \
        --enable-libvpx \
        --enable-libwavpack \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxcb \
        --enable-libxml2 \
        --enable-libxvid \
	--enable-lzma \
        --enable-libdrm \
	--enable-xlib \
        --enable-zlib \
        --enable-omx \
	--enable-openal \
        --enable-opencl \
        --enable-opengl \
	--disable-openssl \
        --enable-libfdk_aac \
        --enable-libmfx \
        --enable-vaapi \
        --enable-vdpau
	
    make
    make tools/qt-faststart
}

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m755 tools/qt-faststart  "${pkgdir}/usr/bin/qt-faststart"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
