# Maintainer:  ahjolinna <@yahoo.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=mpv-ahjolinna-git
_gitname=mpv
pkgver=0.32.0.r484.g152b0e2a8c
pkgrel=1
pkgdesc="MPV using ahjolinna's personal pre-made conf build"
arch=('x86_64')
license=('GPL')
url='http://mpv.io'
depends=(
 # official repositories:
        'cmocka' 'ffmpeg' 'lcms2' 'libcdio-paranoia' 'libgl' 'libxss'
        'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
        'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'mujs'
        'libdvdnav' 'libxrandr' 'jack' 'rubberband' 'uchardet' 'libarchive'
        'zlib' 'vapoursynth' 'openal' 'vulkan-icd-loader' 'shaderc'
        'libplacebo' 'zimg'
    # AUR:
        'spirv-cross'
)

optdepends=('youtube-dl: Another way to view youtuve videos with mpv'
            'zsh-completions: Additional completion definitions for Zsh users'
            'livestreamer: to watch live video streams (twitch.tv)'
            'vapoursynth-plugin-mvtools: Realtime motion interpolating playback in mpv'
            'acpitool: for battery detection'
            'inxi: HIDPI-detection'
            'svp: SmoothVideo Project'
            'adobe-source-sans-pro-fonts: Font as shown in the conf'
            )

makedepends=('vulkan-headers' 'mesa' 'python-docutils'
             'ladspa' 'x265' 'openal' 'jack' 'unzip'
             'samba' 'acpitool' 'inxi' 'git' 'vapoursynth'
             'libvdpau' 'libva' 'streamlink' 'cuda'
             'ffnvcodec-headers' 'ffnvcodec-headers' 
             'hicolor-icon-theme' 'desktop-file-utils' )
optdepends+=('cuda: for CUVID hardware-acceleration for NVIDIA users')

provides=('mpv' 'mpv-git')
conflicts=('mpv' 'mpv-vapoursynth' 'mpv-ahjolinna-build-git' 'mpv-build-git' 'mpv-ahjolinna' )
options=('!emptydirs')
source=(git+https://github.com/mpv-player/mpv
        'git+https://github.com/ahjolinna/mpv-conf'
         'mpv-hq.desktop'
         'mpv-lq.desktop'
         'mpv-mq.desktop'
         'mpv-MVtools.desktop'
         'mpv-SVP.desktop'
         'mpv-CUDA.desktop')

sha256sums=('SKIP'
            'SKIP'
            'ddd18dbccdaa4513586cb97299e88564e3289940f25d7ebe762c4482fbad3809'
            'e02f7b07653ea4ce9745b9f699954f5a4eafd416ada5a5d032c7dd7294921f90'
            '8cf41f23572417836084209fce343f779e72dea9688dc84e23e8eb913d002d5f'
            '9a7f7d78a71c5492709abfb8f4ad598fa02867e71b5645bb639850163264762b'
            '6e1d8057524f69f204f0f0468e7d4f8f6b41a6d22ac1e4bdf3bc1e2efa0e0284'
            'b703510f6e1f36d3f00008c282c7fef52057aa5703b412a7b750fb05c3a6a2e5')

pkgver() {
	cd "$srcdir/$_gitname"
	local _version="$(git tag | sort -Vr | head -n1 | sed 's/^v//')"
	local _revision="$(git rev-list v"$_version"..HEAD --count)"
	local _shorthash="$(git rev-parse --short HEAD)"

	printf "%s.r%s.g%s" "$_version" "$_revision" "$_shorthash"
  }


prepare() {
  cd "$srcdir/$_gitname"
msg2 "Running bootstrap. Please wait..."
	./bootstrap.py

}

build() {
  local _common_opts=(
        '--color=yes'
        '--prefix=/usr'
        '--progress'
        '--confdir=/etc/mpv'

        '--disable-lgpl'
        '--enable-libmpv-shared'
        '--disable-libmpv-static'
        '--disable-static-build'
        '--disable-build-date'
        '--disable-debug-build'
        '--enable-manpage-build'
        '--disable-html-build'
        '--disable-pdf-build'
        '--enable-cplugins'
        '--disable-clang-database'

        '--disable-android'
        '--disable-tvos'
        '--disable-egl-android'
        '--disable-swift'
        '--disable-uwp'
        '--disable-win32-internal-pthreads'
        '--enable-iconv'
        '--enable-lua'
        '--enable-javascript'
        '--enable-zlib'
        '--enable-libbluray'
        '--enable-dvdnav'
        '--enable-cdda'
        '--enable-uchardet'
        '--enable-rubberband'
        '--enable-zimg'
        '--enable-lcms2'
        '--enable-vapoursynth'
        '--enable-libarchive'
        '--enable-dvbin'
        '--enable-sdl2'
        '--enable-sdl2-gamepad'
        '--enable-libavdevice'
        '--disable-ffmpeg-strict-abi'
        '--lua=52arch'
        
        '--enable-sdl2-audio'
        '--enable-pulse'
        '--enable-jack'
        '--enable-openal'
        '--disable-opensles'
        '--enable-alsa'
        '--disable-coreaudio'
        '--disable-audiounit'
        '--disable-wasapi'
        
        '--enable-sdl2-video'
        '--disable-cocoa'
        '--enable-drm'
        '--enable-gbm'
        '--enable-wayland-scanner'
        '--enable-wayland-protocols'
        '--enable-wayland'
        '--enable-x11'
        '--enable-xv'
        '--disable-gl-cocoa'
        '--enable-gl-x11'
        '--enable-egl'
        '--enable-egl-x11'
        '--enable-egl-drm'
        '--enable-gl-wayland'
        '--disable-gl-win32'
        '--disable-gl-dxinterop'
        '--disable-egl-angle'
        '--disable-egl-angle-lib'
        '--disable-egl-angle-win32'
        '--enable-vdpau'
        '--enable-vdpau-gl-x11'
        '--enable-vaapi'
        '--enable-vaapi-x11'
        '--enable-vaapi-wayland'
        '--enable-vaapi-drm'
        '--enable-vaapi-x-egl'
        '--enable-caca'
        '--enable-jpeg'
        '--disable-direct3d'
        '--enable-shaderc'
        '--enable-spirv-cross'
        '--disable-d3d11'
        '--disable-rpi'
        '--disable-ios-gl'
        '--enable-plain-gl'
        '--enable-gl'
        '--enable-libplacebo'
        '--enable-vulkan'
        
        '--disable-videotoolbox-gl'
        '--disable-d3d-hwaccel'
        '--disable-d3d9-hwaccel'
        '--disable-gl-dxinterop-d3d9'
        '--enable-cuda-hwaccel'
        '--enable-cuda-interop'
        '--disable-rpi-mmal'
        
        '--disable-macos-touchbar'
        '--disable-macos-10-11-features'
        '--disable-macos-10-12-2-features'
        '--disable-macos-10-14-features'
        '--disable-macos-media-player'
        '--disable-macos-cocoa-cb')

  cd "$srcdir/$_gitname"
  # build without tests on the mpv binary (goes to package)
 ./waf configure --disable-tests "${_common_opts[@]}"
 ./waf build

 # build with tests on the mpv binary (for tests only)
  printf '%s\n' ' -> Building the test files (with tests)...'
  export WAFLOCK='.lock-waf_linux_build-tests'
  ./waf distclean configure --enable-tests "${_common_opts[@]}"
  ./waf build

}

check() {
    cd mpv

    local _test
    export LD_LIBRARY_PATH="$srcdir/mpv/build-tests"

    while read -r -d '' _test
    do
        printf '%s\n' "Running test '$_test'..."
        build-tests/mpv --unittest="$_test"
    done < <(build-tests/mpv --unittest='help' |
      awk 'FNR == 1 { next } !/all-simple|img_format|repack(|_zimg)/ { printf "%s\0", $1 }')
}



package() {
  cd "$srcdir/$_gitname"


  export WAFLOCK='.lock-waf_linux_build'
  ./waf install --destdir="$pkgdir"
  install -D -m644 DOCS/{encoding.rst,tech-overview.txt} "${pkgdir}/usr/share/doc/mpv"
  install -D -m644 TOOLS/lua/* -t "${pkgdir}/usr/share/mpv/script"

 # install the .desktop files
  install -Dm644 "$srcdir/mpv-lq.desktop" "$pkgdir/usr/share/applications/mpv-lq.desktop"
  install -Dm644 "$srcdir/mpv-mq.desktop" "$pkgdir/usr/share/applications/mpv-mq.desktop"
  install -Dm644 "$srcdir/mpv-hq.desktop" "$pkgdir/usr/share/applications/mpv-hq.desktop"
  install -Dm644 "$srcdir/mpv-MVtools.desktop" "$pkgdir/usr/share/applications/mpv-MVtools.desktop"
  install -Dm644 "$srcdir/mpv-CUDA.desktop" "$pkgdir/usr/share/applications/mpv-CUDA.desktop"
  install -Dm644 "$srcdir/mpv-SVP.desktop" "$pkgdir/usr/share/applications/mpv-SVP.desktop"

  # install BT.709 ICC profiles (https://github.com/mpv-player/mpv/issues/534#issuecomment-35823203)

   cd "$srcdir"/mpv-conf/PKGBUILD
   unzip BT.709_Profiles.zip
   install -Dm755 "BT.709_Profiles/BT.709.gamma.1.95.icc" "$pkgdir/usr/share/color/icc/BT.709_Profiles/BT.709.gamma.1.95.icc"
   install -Dm755 "BT.709_Profiles/BT.709.gamma.1.95.icc" "$pkgdir/usr/share/color/icc/BT.709_Profiles/BT.709.icc"
   install -Dm755 "BT.709_Profiles/BT.709.gamma.1.95.icc" "$pkgdir/usr/share/color/icc/BT.709_Profiles/BT.709.linear.icc"

    #install ahjolinna "config-build" files
 cp -R "$srcdir"/mpv-conf/mpv/etc/* "$pkgdir"/etc/mpv
    install -d "$pkgdir/etc/mpv/"

cp "$srcdir/$_gitname"/etc/encoding-profiles.conf "$pkgdir"/etc/mpv

  }
