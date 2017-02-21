# Maintainer:  ahjolinna <@yahoo.com>

# WARNING: The configure script will automatically enable any optional
# features it finds support for on your system. If you want to avoid
# linking against something you have installed, you'll have to disable
# it in the configure below. The package() script will attempt to
# update the dependencies based on dynamic libraries when packaging.

pkgname=mpv-ahjolinna-git
_gitname=mpv
pkgver=0.24.0.r60.ge85d06baad
pkgrel=1
#epoch=2
pkgdesc="MPV using ahjolinna's personal pre-made conf build"
arch=('x86_64')
license=('GPL3')
url='http://mpv.io'
screenshot='http://i.imgur.com/6TacA5I.png'
_undetected_depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
depends=('pulseaudio' 'lcms2' 'libdvdread' 'libgl' 'libvdpau'
         'libxinerama' 'libxv' 'libxkbcommon' 'libva'  'libass' 'uchardet' 
	 'wayland' 'v4l-utils' 'lua52' 'rsound' 'sndio' 'libdvdnav' 'libcdio-paranoia' 'libbluray' 'libxss'
         'enca' 'libguess' 'harfbuzz' 'libxrandr' 'rubberband' 'smbclient' "${_undetected_depends[@]}")

depends_i686=(
  'libcdio-paranoia' 'libcaca' 'smbclient' 'rubberband' 'libass'
  'libbluray' 'sdl2' 'openal' 'ffmpeg-full'
)
depends_x86_64=('ffmpeg-full-git')
optdepends=('youtube-dl: Another way to view youtuve videos with mpv'
            'zsh-completions: Additional completion definitions for Zsh users'
            'livestreamer: to watch live video streams (twitch.tv)'
            'vapoursynth-plugin-mvtools: Realtime motion interpolating playback in mpv'
            'acpitool: for battery detection'
            'inxi: HIDPI-detection'
            'svp: SmoothVideo Project'
            'adobe-source-sans-pro-fonts: Font as shown in the conf'
            )

makedepends=('mesa' 'python-docutils' 'ladspa' 'x264' 'x265' 'openal' 'jack'
             'samba' 'acpitool' 'inxi' 'git' 'vapoursynth' 'libvdpau' 'libva'
              'livestreamer' 'youtube-dl')
# check kind of graphic card
if [ "$CARCH" = "x86_64" ] ; then
makedepends+=('cuda')
optdepends+=('cuda: for CUVID hardware-acceleration for NVIDIA users')
fi
    
provides=('mpv')
conflicts=('mpv' 'mpv-vapoursynth' 'mpv-ahjolinna-build-git' 'mpv-build-git' 'mpv-ahjolinna' )
options=('!emptydirs')
install=mpv.install
source=('git+https://github.com/mpv-player/mpv'
        'find-deps.py'
         #"ftp://ftp.ritual.org/common/ColorManagement/BT.709_Profiles.zip"
	 "https://raw.githubusercontent.com/ahjolinna/mpv-conf/master/PKGBUILD/BT.709_Profiles.zip"
         "https://github.com/ahjolinna/mpv-conf/raw/master/PKGBUILD/mpv.tar.gz"
        'mpv-hq.desktop'
         'mpv-lq.desktop'
         'mpv-mq.desktop'
         'mpv-MVtools.desktop'
         'mpv-SVP.desktop'
         'mpv-CUDA.desktop')

sha256sums=('SKIP'
            'ce974e160347202e0dc63f6a7a5a89e52d2cc1db2d000c661fddb9dc1d007c02'
            'd53aa2c59350a8e364b1a18a5509ba995826f7d37e34ad029251bee082f3c360'
            '8be87f68786ec3a01af23f2213b61ff962249f87a2ce2e7baccf9cba61b3ac07'
            'ddd18dbccdaa4513586cb97299e88564e3289940f25d7ebe762c4482fbad3809'
            'e02f7b07653ea4ce9745b9f699954f5a4eafd416ada5a5d032c7dd7294921f90'
            '8cf41f23572417836084209fce343f779e72dea9688dc84e23e8eb913d002d5f'
            '9a7f7d78a71c5492709abfb8f4ad598fa02867e71b5645bb639850163264762b'
            '6e1d8057524f69f204f0f0468e7d4f8f6b41a6d22ac1e4bdf3bc1e2efa0e0284'
            'aa27eb7993f9b6246bee3bcca18274491fe428622e658f1e1ad0067dff2622a5')

pkgver() {
	cd "${srcdir}/$_gitname"
	local _version="$(git tag | sort -Vr | head -n1 | sed 's/^v//')"
	local _revision="$(git rev-list v${_version}..HEAD --count)"
	local _shorthash="$(git rev-parse --short HEAD)"
	
	printf "%s.r%s.g%s" "$_version" "$_revision" "$_shorthash"
  }


prepare() {
  cd "${srcdir}/$_gitname"
msg2 "Running bootstrap. Please wait..."
	./bootstrap.py

}  

build() {
  cd "${srcdir}/$_gitname"
CFLAGS="$CFLAGS -I/usr/include/samba-4.0"
 ./waf configure \
	            --color=yes \
	            --prefix=/usr \
	            --confdir=/etc/mpv \
	            --progress \
	            --enable-libmpv-shared \
	            --disable-libmpv-static \
	            --disable-static-build \
	            --disable-debug-build \
	            --enable-manpage-build \
	            --disable-html-build \
	            --disable-pdf-build \
	            --enable-cplugins \
	            --enable-vf-dlopen-filters \
	            --enable-zsh-comp \
	            --disable-test \
	            --disable-clang-database \
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
	            --enable-vaapi-hwaccel \
	            --enable-vaapi-hwaccel-new \
	            --disable-videotoolbox-hwaccel \
	            --disable-videotoolbox-gl \
	            --enable-vdpau-hwaccel \
	            --disable-d3d-hwaccel \
              --enable-tv \
	            --enable-tv-v4l2 \
	            --enable-libv4l2 \
	            --enable-audio-input \
	            --enable-dvbin \
	            --disable-apple-remote
	
	./waf build
}
package() {
  cd "$srcdir/$_gitname"
  ./waf install --destdir="${pkgdir}" 


 # install the .desktop files
  install -Dm644 "${srcdir}/mpv-lq.desktop" "${pkgdir}/usr/share/applications/mpv-lq.desktop"
  install -Dm644 "${srcdir}/mpv-mq.desktop" "${pkgdir}/usr/share/applications/mpv-mq.desktop"
  install -Dm644 "${srcdir}/mpv-hq.desktop" "${pkgdir}/usr/share/applications/mpv-hq.desktop"
  install -Dm644 "${srcdir}/mpv-MVtools.desktop" "${pkgdir}/usr/share/applications/mpv-MVtools.desktop"
  install -Dm644 "${srcdir}/mpv-CUDA.desktop" "${pkgdir}/usr/share/applications/mpv-CUDA.desktop"
  install -Dm644 "${srcdir}/mpv-SVP.desktop" "${pkgdir}/usr/share/applications/mpv-SVP.desktop"
  
  
  
  
  # install BT.709 ICC profiles (https://github.com/mpv-player/mpv/issues/534#issuecomment-35823203)
   install -Dm755 "${srcdir}/BT.709_Profiles/BT.709.gamma.1.95.icc" "${pkgdir}/usr/share/color/icc/BT.709_Profiles/BT.709.gamma.1.95.icc"
   install -Dm755 "${srcdir}/BT.709_Profiles/BT.709.gamma.1.95.icc" "${pkgdir}/usr/share/color/icc/BT.709_Profiles/BT.709.icc"
   install -Dm755 "${srcdir}/BT.709_Profiles/BT.709.gamma.1.95.icc" "${pkgdir}/usr/share/color/icc/BT.709_Profiles/BT.709.linear.icc"
  
  
    #install ahjolinna "config-build" files
 cp -R ${srcdir}/mpv/etc*/* ${pkgdir}/etc/mpv
    install -d "${pkgdir}/etc/mpv/"
  

  # Update dependencies automatically based on dynamic libraries
  _detected_depends=($("$srcdir"/find-deps.py "$pkgdir"/usr/{bin/mpv,lib/libmpv.so}))
  
  msg 'Auto-detected dependencies:'
  echo "${_detected_depends[@]}" | fold -s -w 79 | sed 's/^/ /'
  depends=("${_detected_depends[@]}" "${_undetected_depends[@]}")
}
