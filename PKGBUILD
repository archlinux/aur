# Maintainer: Andre Vallestero < gmail-com: andrevallestero >

pkgname=ffmpeg-v4l2-request-git
_srcname=FFmpeg
pkgver=r94743.fa3f88530e
pkgrel=3
pkgdesc='FFmpeg with v4l2-request support'
arch=('aarch64')
url='https://github.com/Kwiboo/FFmpeg/tree/v4l2-request-hwaccel-4.2.2'
license=('GPL3')
depends=('alsa-lib' 'bzip2' 'fontconfig' 'fribidi' 'glibc' 'gmp' 'gnutls' 'gsm'
         'jack' 'lame' 'libavc1394' 'libdrm' 'libiec61883' 'libmodplug'
         'libomxil-bellagio' 'libpulse' 'libraw1394' 'libsoxr' 'libssh' 'libtheora'
         'libvdpau' 'libwebp' 'libx11' 'libxcb' 'libxext' 'libxml2' 'libxv'
         'opencore-amr' 'openjpeg2' 'opus' 'sdl2' 'speex' 'v4l-utils' 'xz' 'zlib'
         'ladspa' 'libass.so' 'libbluray.so' 'libfreetype.so' 'libva-drm.so'
         'libva.so' 'libva-x11.so' 'libvidstab.so' 'libvorbisenc.so' 'libvorbis.so'
         'libvpx.so' 'libx264.so' 'libx265.so' 'libxvidcore.so')
makedepends=('git')
optdepends=('intel-media-sdk: for Intel Quick Sync Video'
            'ladspa: for LADSPA filters')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswresample.so' 'libswscale.so'
          'ffmpeg')
conflicts=('ffmpeg')
source=('git+https://github.com/Kwiboo/FFmpeg.git#branch=v4l2-request-hwaccel-4.2.2')
sha256sums=('SKIP')

pkgver() {
	cd "$_srcname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_srcname"

	printf '%s\n' '  -> Running ffmpeg configure script...'

	./configure \
        --prefix='/usr' \
        --disable-debug \
        --disable-static \
        --disable-stripping \
        --enable-fontconfig \
        --enable-gmp \
        --enable-gnutls \
        --enable-gpl \
        --enable-ladspa \
        --enable-libass \
        --enable-libbluray \
        --enable-libdrm \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libgsm \
        --enable-libiec61883 \
        --enable-libjack \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libopencore_amrnb \
        --enable-libopencore_amrwb \
        --enable-libopenjpeg \
        --enable-libopus \
        --enable-libpulse \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libssh \
        --enable-libtheora \
        --enable-libv4l2 \
        --enable-libvidstab \
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
        --enable-version3 \
        --enable-libudev \
        --enable-v4l2-request \
        --enable-pic

	make
	make tools/qt-faststart
}

package() {
	make -C "$_srcname" DESTDIR="$pkgdir" install
	install -D -m755 "$_srcname"/tools/qt-faststart -t "${pkgdir}/usr/bin"
}
