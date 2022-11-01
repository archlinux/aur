# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Contributor: Marko Korhonen <reekymarko at reekynet.com>
# Contributor: Bruno Filipe < gmail-com: bmilreu >
# Original: Daniel Bermond <dbermond@archlinux.org> https://aur.archlinux.org/packages/mpv-full-git

pkgname=mpv-amd-full-git
pkgver=0.34.1.r557.gd555ae9571
pkgrel=1
pkgdesc='A free, open source, and cross-platform media player (git version with all possible libs)'
arch=('x86_64')
license=('GPL')
url='https://mpv.io/'
depends=(
    # official repositories:
        'cmocka' 'lcms2' 'libcdio-paranoia' 'libgl' 'libxss'
        'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
        'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'mujs'
        'libdvdnav' 'libxrandr' 'jack' 'rubberband' 'uchardet' 'libarchive'
        'zlib' 'vapoursynth' 'openal' 'vulkan-icd-loader' 'shaderc'
        'libplacebo' 'libxpresent' 'pipewire' 'zimg' 'ffmpeg' 'sndio' 'libsixel'
    # AUR:
        'spirv-cross'
)
makedepends=('git' 'mesa' 'python-docutils' 'ladspa' 'vulkan-headers'
             'wayland-protocols')
optdepends=('youtube-dl: for video-sharing websites playback')
provides=('mpv' 'mpv-git')
conflicts=('mpv')
options=('!emptydirs')
source=('git+https://github.com/mpv-player/mpv.git')
sha256sums=('SKIP')

prepare() {
    cd mpv
    ./bootstrap.py
}

pkgver() {    
    local _version
    local _revision
    local _shorthash
    
    _version="$(git -C mpv tag | sort -Vr | head -n1 | sed 's/^v//')"
    _revision="$(git -C mpv rev-list v"${_version}"..HEAD --count)"
    _shorthash="$(git -C mpv rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
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
        '--lua=52arch'
        
        '--enable-sdl2-audio'
        '--disable-oss-audio'
        '--enable-pipewire'
        '--enable-sndio'
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
        '--enable-sixel'
        
        '--disable-videotoolbox-gl'
        '--disable-d3d-hwaccel'
        '--disable-d3d9-hwaccel'
        '--disable-gl-dxinterop-d3d9'
        '--disable-cuda-hwaccel'
        '--disable-cuda-interop'
        '--disable-rpi-mmal'
        
        '--disable-macos-touchbar'
        '--disable-macos-10-11-features'
        '--disable-macos-10-12-2-features'
        '--disable-macos-10-14-features'
        '--disable-macos-media-player'
        '--disable-macos-cocoa-cb')
    
    cd mpv
    
    # build without tests on the mpv binary (goes to package)
    printf '%s\n' ' -> Building the release files (without tests)...'
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
    export LD_LIBRARY_PATH="${srcdir}/mpv/build-tests"
    
    while read -r -d '' _test
    do
        printf '%s\n' "Running test '${_test}'..."
        build-tests/mpv --unittest="$_test"
    done < <(build-tests/mpv --unittest='help' |
        awk 'FNR == 1 { next } !/all-simple|img_format|repack(|_zimg)$/ { printf "%s\0", $1 }')
}

package() {
    cd mpv
    
    export WAFLOCK='.lock-waf_linux_build'
    ./waf install --destdir="$pkgdir"
    
    install -D -m644 DOCS/{encoding.rst,tech-overview.txt} "${pkgdir}/usr/share/doc/mpv"
    install -D -m644 TOOLS/lua/* -t "${pkgdir}/usr/share/mpv/script"
}
