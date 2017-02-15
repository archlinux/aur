# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# To enable CUDA support you need a ffmpeg build that has been
# compiled with CUDA (ffmpeg-full-git).
# CUDA is x86_64 only and so it will not be available in i686 builds.

# AUR dependencies
# ----------------
# i686: rsound sndio uchardet
# x86_64: all from i686 and ffmpeg-full-git

_srcname=mpv
pkgname=mpv-full
pkgver=0.24.0
pkgrel=1
pkgdesc='A free, open source, and cross-platform media player (with all possible libs)'
arch=('i686' 'x86_64')
license=('GPL')
url='http://mpv.io/'
depends=(
  'lcms2' 'libgl' 'libxss' 'libxinerama' 'libxv' 'libxkbcommon' 'wayland'
  'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
  'libxrandr' 'jack' 'vapoursynth' 'libarchive' 'uchardet' 'rsound' 'sndio'
)
depends_i686=(
  'libcdio-paranoia' 'libcaca' 'smbclient' 'rubberband' 'libass'
  'libbluray' 'sdl2' 'openal' 'ffmpeg'
)
depends_x86_64=('ffmpeg-full-git')
optdepends=('youtube-dl: for video-sharing websites playback')
makedepends=('git' 'mesa' 'python-docutils' 'ladspa')
provides=('mpv')
conflicts=('mpv' 'mpv-git' 'mpv-full-git')
options=('!emptydirs')
source=("$_srcname-$pkgver.tar.gz::https://github.com/mpv-player/$_srcname/archive/v$pkgver.tar.gz")
sha256sums=('a41854fa0ac35b9c309ad692aaee67c8d4495c3546f11cb4cdd0a124195d3f15')

build() {
	cd "${_srcname}-${pkgver}"
	
	# Add CUDA to the build if architecture is x86_64
	if [ "$CARCH" = "x86_64" ] 
	then
	    _cuda="--enable-cuda-hwaccel"
	else
	    _cuda="--disable-cuda-hwaccel"
	fi
	
	msg2 "Running bootstrap. Please wait..."
	./bootstrap.py
	
	./waf configure \
	            --color=yes \
	            --prefix=/usr \
	            --confdir=/etc/mpv \
	            --progress \
	            \
	            --enable-libmpv-shared \
	            --disable-libmpv-static \
	            --disable-static-build \
	            --disable-debug-build \
	            \
	            --enable-manpage-build \
	            --disable-html-build \
	            --disable-pdf-build \
	            \
	            --enable-cplugins \
	            --enable-vf-dlopen-filters \
	            --enable-zsh-comp \
	            --disable-test \
	            --disable-clang-database \
	            \
	            --disable-win32-internal-pthreads \
	            --enable-iconv \
	            --enable-termios \
	            --enable-shm \
	            --enable-libsmbclient \
	            --enable-lua \
	            --enable-libass \
	            --enable-libass-osd \
	            --enable-encoding \
	            --enable-libbluray \
	            --enable-dvdread \
	            --enable-dvdnav \
	            --enable-cdda \
	            --enable-uchardet \
	            --enable-rubberband \
	            --enable-lcms2 \
	            --enable-vapoursynth \
	            --enable-vapoursynth-lazy \
	            --enable-libarchive \
	            --enable-libavdevice \
	            --lua=52arch \
	            \
	            --enable-sdl2 \
	            --disable-sdl1 \
	            --enable-oss-audio \
	            --enable-rsound \
	            --enable-sndio \
	            --enable-pulse \
	            --enable-jack \
	            --enable-openal \
	            --disable-opensles \
	            --enable-alsa \
	            --disable-coreaudio \
	            --disable-audiounit \
	            --disable-wasapi \
	            \
	            --disable-cocoa \
	            --enable-drm \
	            --enable-gbm \
	            --enable-wayland \
	            --enable-x11 \
	            --enable-xss \
	            --enable-xext \
	            --enable-xv \
	            --enable-xinerama \
	            --enable-xrandr \
	            --disable-gl-cocoa \
	            --enable-gl-x11 \
	            --enable-egl-x11 \
	            --enable-egl-drm \
	            --enable-gl-wayland \
	            --disable-gl-win32 \
	            --disable-gl-dxinterop \
	            --disable-egl-angle \
	            --disable-egl-angle-lib \
	            --enable-vdpau \
	            --enable-vdpau-gl-x11 \
	            --enable-vaapi \
	            --enable-vaapi-x11 \
	            --enable-vaapi-wayland \
	            --enable-vaapi-drm \
	            --enable-vaapi-glx \
	            --enable-vaapi-x-egl \
	            --enable-caca \
	            --enable-jpeg \
	            --disable-direct3d \
	            --disable-android \
	            --disable-rpi \
	            --enable-standard-gl \
	            --disable-android-gl \
	            --disable-ios-gl \
	            --enable-any-gl \
	            --enable-plain-gl \
	            --disable-mali-fbdev \
	            --enable-gl \
	            \
	            --enable-vaapi-hwaccel \
	            --enable-vaapi-hwaccel-new \
	            --disable-videotoolbox-hwaccel \
	            --disable-videotoolbox-gl \
	            --enable-vdpau-hwaccel \
	            --disable-d3d-hwaccel \
	            "$_cuda" \
	            \
	            --enable-tv \
	            --enable-tv-v4l2 \
	            --enable-libv4l2 \
	            --enable-audio-input \
	            --enable-dvbin \
	            --disable-apple-remote
	
	./waf build
}

package() {
	cd "${_srcname}-${pkgver}"
	
	./waf install --destdir="$pkgdir"
	
	install -m644 DOCS/{encoding.rst,tech-overview.txt} \
	        "$pkgdir"/usr/share/doc/mpv
}
