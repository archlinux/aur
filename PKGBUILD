# Maintainer:

# NOTE:
# To enable CUDA support you need a ffmpeg build that has been
# compiled with CUDA (ffmpeg-full-git).
# CUDA is x86_64 only and so it will not be available in i686 builds.

# AUR dependencies
# ----------------
# i686: rsound sndio uchardet
# x86_64: all from i686 and ffmpeg-full-git

pkgname=mpv-semifull-git
pkgver=0.27.0.r537.gd7d670fcbf
pkgrel=1
pkgdesc='A free, open source, and cross-platform media player [With most librarys excluding CUDA and INTEL for 
now...]'
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
depends_x86_64=('ffmpeg-git')
optdepends=('youtube-dl: for video-sharing websites playback')
makedepends=('git' 'mesa' 'python-docutils' 'ladspa')
provides=('mpv')
conflicts=('mpv' 'mpv-git')
options=('!emptydirs')
source=("$pkgname"::'git+https://github.com/mpv-player/mpv.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	
	local _version="$(git tag | sort -Vr | head -n1 | sed 's/^v//')"
	local _revision="$(git rev-list v${_version}..HEAD --count)"
	local _shorthash="$(git rev-parse --short HEAD)"
	
	printf "%s.r%s.g%s" "$_version" "$_revision" "$_shorthash"
}

build() {
	cd "${srcdir}/${pkgname}"
	
	# Add CUDA to the build if architecture is x86_64
# 	if [ "$CARCH" = "x86_64" ] 
# 	then
# 	    _cuda="--enable-cuda-hwaccel"
# 	else
	    _cuda="--disable-cuda-hwaccel"
# 	fi
	
	msg2 "Running bootstrap. Please wait..."
	./bootstrap.py
	
	./waf configure \
	            --color=yes \
	            --prefix=/usr \
	            --confdir=/etc/mpv \
	            --progress \
	            --jobs=`echo $MAKEFLAGS | tr -d "j" | tr -d "-"` \
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
	            --enable-zsh-comp \
	            --disable-test \
	            --disable-clang-database \
	            \
	            --disable-win32-internal-pthreads \
	            --enable-iconv \
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
	            --enable-xv \
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
	            --disable-ios-gl \
	            --enable-plain-gl \
	            --disable-mali-fbdev \
	            --enable-gl \
	            \
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
	cd "${srcdir}/${pkgname}"
	
	./waf install --destdir="$pkgdir"
	
	install -m644 DOCS/{encoding.rst,tech-overview.txt} \
	        "$pkgdir"/usr/share/doc/mpv
}
