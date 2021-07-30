# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mpv-full
pkgver=0.33.1
pkgrel=3
_wafver=2.0.20
pkgdesc='A free, open source, and cross-platform media player (with all possible libs)'
arch=('x86_64')
license=('GPL')
url='https://mpv.io/'
depends=(
    # official repositories:
        'cmocka' 'ffmpeg' 'lcms2' 'libcdio-paranoia' 'libgl' 'libxss'
        'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
        'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'mujs'
        'libdvdnav' 'libxrandr' 'jack' 'rubberband' 'uchardet' 'libarchive'
        'zlib' 'vapoursynth' 'openal' 'vulkan-icd-loader' 'shaderc'
        'libplacebo' 'zimg'
    # AUR:
        'spirv-cross' 'libsixel'
)
makedepends=('mesa' 'python-docutils' 'ladspa' 'vulkan-headers'
             'wayland-protocols' 'ffnvcodec-headers')
optdepends=('youtube-dl: for video-sharing websites playback'
            'nvidia-utils: for hardware accelerated video decoding with CUDA')
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
BUILDENV=('!check')
source=("https://github.com/mpv-player/mpv/archive/v${pkgver}/mpv-${pkgver}.tar.gz"
        "https://waf.io/waf-${_wafver}"
        '010-mpv-libplacebo-fix.patch'::'https://github.com/mpv-player/mpv/commit/7c4465cefb27d4e0d07535d368febdf77b579566.patch')
sha256sums=('100a116b9f23bdcda3a596e9f26be3a69f166a4f1d00910d1789b6571c46f3a9'
            'bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f'
            'a9f656a163e17a33050ea3ffe51203b948168437c87038239fc3a2424927b35a')

prepare() {
    install -D -m755 "waf-${_wafver}" "mpv-${pkgver}/waf"
    patch -d "mpv-${pkgver}" -Np1 -i "${srcdir}/010-mpv-libplacebo-fix.patch"
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
        '--enable-sixel'
        
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
    
    cd "mpv-${pkgver}"
    
    # build without tests on the mpv binary (goes to package)
    printf '%s\n' ' -> Building the release files (without tests)...'
    ./waf configure --disable-tests "${_common_opts[@]}"
    ./waf build
    
    ## tests currently requires ffmpeg git master, disabling for the time being
    # build with tests on the mpv binary (for tests only)
    #printf '%s\n' ' -> Building the test files (with tests)...'
    #export WAFLOCK='.lock-waf_linux_build-tests'
    #./waf distclean configure --enable-tests "${_common_opts[@]}"
    #./waf build
}

check() {
    cd "mpv-${pkgver}"
    local _test
    export LD_LIBRARY_PATH="${srcdir}/mpv-${pkgver}/build-tests"
    while read -r -d '' _test
    do
        printf '%s\n' "  -> Running test '${_test}'..."
        build-tests/mpv --unittest="$_test"
    done < <(build-tests/mpv --unittest='help' |
        awk 'FNR == 1 { next } !/all-simple|img_format|repack(|_zimg)$/ { printf "%s\0", $1 }')
}

package() {
    cd "mpv-${pkgver}"
    export WAFLOCK='.lock-waf_linux_build'
    ./waf install --destdir="$pkgdir"
    install -D -m644 DOCS/{encoding.rst,tech-overview.txt} "${pkgdir}/usr/share/doc/mpv"
    install -D -m644 TOOLS/lua/* -t "${pkgdir}/usr/share/mpv/script"
}
