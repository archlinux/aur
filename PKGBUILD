# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# AUR dependencies
# ----------------
# libilbc kvazaar chromaprint-fftw libbs2b openh264 shine vo-amrwbenc
# nut-multimedia-git xavs libmfx-git libopenmpt-svn

# AUR make dependencies
# ---------------------
# flite1 blackmagic-decklink-sdk

# AUR optional dependency
# -----------------------
# intel-media-sdk (experimental Intel QSV support only for x86_64)

pkgname=ffmpeg-full-git
pkgver=N.83584.ge8a3498f24
pkgrel=1
pkgdesc="Record, convert and stream audio and video (Git version with all possible libs)"
arch=('i686' 'x86_64')
url="http://www.ffmpeg.org/"
license=('GPL3' 'custom:UNREDISTRIBUTABLE')
depends=(
    'alsa-lib' 'zlib' 'bzip2' 'xz' 'libpng' 'chromaprint-fftw' 'fontconfig' 'frei0r-plugins'
    'libgcrypt' 'gmp' 'gnutls' 'glibc' 'ladspa' 'libass' 'libbluray' 'libbs2b' 'libcaca' 'celt'
    'libcdio-paranoia' 'libdc1394' 'libfdk-aac' 'freetype2' 'fribidi' 'libgme' 'gsm'
    'libiec61883' 'libilbc' 'kvazaar' 'libmodplug' 'lame' 'netcdf' 'nut-multimedia-git'
    'opencore-amr' 'opencv' 'openh264' 'openjpeg2' 'libopenmpt-svn' 'opus' 'pulseaudio'
    'rubberband' 'rtmpdump' 'schroedinger' 'shine' 'smbclient' 'libavc1394' 'snappy' 'libsoxr'
    'speex' 'libssh' 'tesseract' 'libtheora' 'twolame' 'v4l-utils' 'vid.stab' 'vo-amrwbenc'
    'libvorbis' 'libvpx' 'wavpack' 'libwebp' 'libx264.so' 'x265' 'libxcb' 'xvidcore' 'zimg'
    'zeromq' 'zvbi' 'openal' 'libva' 'libdrm' 'libva-intel-driver' 'opencl-icd-loader'
    'libvdpau' 'mesa' 'openssl' 'xavs' 'sdl2' 'java-environment' 'libmfx-git'
    'libomxil-bellagio'
)
depends_x86_64=('cuda')
optdepends_x86_64=('intel-media-sdk: for Intel QSV support (experimental)')
makedepends=('git' 'yasm' 'opencl-headers' 'flite1' 'blackmagic-decklink-sdk')
provides=(
    'ffmpeg' 'qt-faststart' 'ffmpeg-git' 'ffmpeg-full' 'ffmpeg-full-extra' 'ffmpeg-full-nvenc'
    'ffmpeg-libfdk_aac' 'libavutil.so' 'libavcodec.so' 'libavformat.so' 'libavdevice.so'
    'libavfilter.so' 'libavresample.so' 'libswscale.so' 'libswresample.so' 'libpostproc.so'
)
conflicts=(
    'ffmpeg' 'ffmpeg-git' 'ffmpeg-full' 'ffmpeg-full-extra' 'ffmpeg-full-nvenc'
    'ffmpeg-libfdk_aac')
source=("$pkgname"::'git://source.ffmpeg.org/ffmpeg.git'
        'UNREDISTRIBUTABLE.txt')
sha256sums=('SKIP'
            'e0c1b126862072a71e18b9580a6b01afc76a54aa6e642d2c413ba0ac9d3010c4')

pkgver() {
	cd "${srcdir}/${pkgname}"
	
	# Git, tags available
	        
	# Method showing version based on FFmpeg Git versioning system
	printf "%s" "$(git describe --tags --match N | tr '-' '.')"
}

build() {
	cd "${srcdir}/${pkgname}"
	
	# Add x86_64 depends and optdepends to the build if architecture is x86_64
	if [ "$CARCH" = "x86_64" ]; then
	    _cuda="--enable-cuda"
	    _cudainc="-I/opt/cuda/include"
	    _cudalib="-L/opt/cuda/lib64"
	    _cuvid="--enable-cuvid"
	    _libnpp="--enable-libnpp"
	    _intelsdklib="-Wl,-rpath -Wl,/opt/intel/mediasdk/lib64"
	else
	    _cuda=""
	    _cudainc=""
	    _cudalib=""
	    _cuvid=""
	    _libnpp=""
	    _intelsdklib=""
	fi
	
	msg2 "Running ffmpeg configure script. Please wait..."
	
	./configure \
	        --prefix=/usr \
	        --extra-cflags="-I/usr/lib/jvm/$(archlinux-java get)/include \
	                        -I/usr/lib/jvm/$(archlinux-java get)/include/linux \
	                        ${_cudainc}" \
	        --extra-ldflags="${_cudalib} ${_intelsdklib}" \
	        \
	        --enable-rpath \
	        --enable-gpl \
	        --enable-version3 \
	        --enable-nonfree \
	        --enable-shared \
	        --disable-static \
	        --enable-gray \
	        --enable-avresample \
	        \
	        --enable-avisynth \
	        --enable-bzlib \
	        --enable-chromaprint \
	        --enable-frei0r \
	        --enable-gcrypt \
	        --enable-gmp \
	        --enable-gnutls \
	        --enable-iconv \
	        --enable-jni \
	        --enable-ladspa \
	        --enable-libass \
	        --enable-libbluray \
	        --enable-libbs2b \
	        --enable-libcaca \
	        --enable-libcelt \
	        --enable-libcdio \
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
	        --enable-libkvazaar \
	        --enable-libmodplug \
	        --enable-libmp3lame \
	        --enable-libnut \
	        --enable-libopencore-amrnb \
	        --enable-libopencore-amrwb \
	        --enable-libopencv \
	        --enable-libopenh264 \
	        --enable-libopenjpeg \
	        --enable-libopenmpt \
	        --enable-libopus \
	        --enable-libpulse \
	        --enable-librubberband \
	        --enable-librtmp  \
	        --enable-libschroedinger \
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
	        --enable-libzimg \
	        --enable-libzmq \
	        --enable-libzvbi \
	        --enable-lzma \
	        --enable-decklink \
	        --enable-mediacodec \
	        --enable-netcdf \
	        --enable-openal \
	        --enable-opencl \
	        --enable-opengl \
	        --enable-openssl \
	        --enable-sdl2 \
	        --enable-x11grab \
	        --enable-xlib \
	        --enable-zlib \
	        \
	        $_cuda \
	        $_cuvid \
	        --enable-libmfx \
	        $_libnpp \
	        --enable-nvenc \
	        --enable-omx \
	        --enable-omx-rpi \
	        --enable-vaapi \
	        --enable-vdpau \
	        --enable-videotoolbox
	
	make
	
	make tools/qt-faststart
}

package() {
	cd "${srcdir}/${pkgname}"
	
	make DESTDIR="$pkgdir/" install
	
	install -D -m755 tools/qt-faststart "${pkgdir}/usr/bin/qt-faststart"
	install -D -m644 "$srcdir"/UNREDISTRIBUTABLE.txt "${pkgdir}/usr/share/licenses/${pkgname}/UNREDISTRIBUTABLE.txt"
}
