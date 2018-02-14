# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=mpv-full-git
pkgver=0.28.2.r279.g6751b5b1c2
pkgrel=1
pkgdesc='A free, open source, and cross-platform media player (git version with all possible libs)'
arch=('i686' 'x86_64')
license=('GPL3')
url='http://mpv.io/'
depends=(
    # official repositories:
        'lcms2' 'libcdio-paranoia' 'libgl' 'libxss'
        'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
        'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
        'libxrandr' 'jack' 'rubberband' 'uchardet' 'libarchive'
        'openal' 'smbclient' 'vulkan-icd-loader' 'zlib'
        
    # AUR:
        'ffmpeg-git' 'mujs' 'rsound' 'sndio' 'shaderc-git' 'crossc'
        'vapoursynth-git'
)
optdepends=('youtube-dl: for video-sharing websites playback'
            'nvidia-utils: for hardware accelerated video decoding with CUDA')
makedepends=('git' 'mesa' 'python-docutils' 'ladspa' 'vulkan-headers'
             'wayland-protocols')
provides=('mpv')
conflicts=('mpv' 'mpv-git')
options=('!emptydirs')
source=("$pkgname"::'git+https://github.com/mpv-player/mpv.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    local _version="$(git tag | sort -Vr | head -n1 | sed 's/^v//')"
    local _revision="$(git rev-list v"${_version}"..HEAD --count)"
    local _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd "$pkgname"
    
    msg2 'Running bootstrap. Please wait...'
    ./bootstrap.py
    
    ./waf configure \
        --color='yes' \
        --prefix='/usr' \
        --progress \
        --confdir='/etc/mpv' \
        \
        --disable-lgpl \
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
        --disable-android \
        --disable-uwp \
        --disable-win32-internal-pthreads \
        --enable-iconv \
        --enable-libsmbclient \
        --enable-lua \
        --enable-javascript \
        --enable-libass \
        --enable-libass-osd \
        --enable-zlib \
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
        --lua='52arch' \
        \
        --enable-sdl2 \
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
        --enable-drmprime \
        --enable-gbm \
        --enable-wayland-scanner \
        --enable-wayland-protocols \
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
        --disable-egl-angle-win32 \
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
        --enable-shaderc \
        --enable-crossc \
        --disable-d3d11 \
        --disable-rpi \
        --disable-ios-gl \
        --enable-plain-gl \
        --disable-mali-fbdev \
        --enable-gl \
        --enable-vulkan \
        \
        --disable-videotoolbox-gl \
        --disable-d3d-hwaccel \
        --disable-d3d9-hwaccel \
        --disable-gl-dxinterop-d3d9 \
        --enable-cuda-hwaccel \
        \
        --enable-tv \
        --enable-tv-v4l2 \
        --enable-libv4l2 \
        --enable-audio-input \
        --enable-dvbin \
        \
        --disable-apple-remote \
        --disable-macos-touchbar \
        --disable-macos-cocoa-cb
    
    ./waf build
}

package() {
    cd "$pkgname"
    ./waf install --destdir="$pkgdir"
    install -m644 DOCS/{encoding.rst,tech-overview.txt} "${pkgdir}/usr/share/doc/mpv"
}
