# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=mpv
pkgname=mpv-full
pkgver=0.28.2
pkgrel=5
pkgdesc='A free, open source, and cross-platform media player (with all possible libs)'
arch=('i686' 'x86_64')
license=('GPL3')
url='http://mpv.io/'
depends=(
    # official repositories:
        'ffmpeg' 'lcms2' 'libcdio-paranoia' 'libgl' 'libxss'
        'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
        'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'libdvdnav'
        'libxrandr' 'jack' 'rubberband' 'uchardet' 'libarchive' 'smbclient'
        'zlib' 'vapoursynth' 'sndio' 'openal' 'vulkan-icd-loader'
        
    # AUR:
        'mujs' 'rsound' 'shaderc-git' 'crossc'
)
optdepends=('youtube-dl: for video-sharing websites playback'
            'nvidia-utils: for hardware accelerated video decoding with CUDA')
makedepends=('mesa' 'python-docutils' 'ladspa' 'vulkan-headers'
             'wayland-protocols')
provides=('mpv')
conflicts=('mpv' 'mpv-git' 'mpv-full-git')
options=('!emptydirs')
source=("${_srcname}-${pkgver}.tar.gz"::"https://github.com/mpv-player/${_srcname}/archive/v${pkgver}.tar.gz"
        'mpv-full-fix-build-with-ffmpeg-git.patch')
sha256sums=('aada14e025317b5b3e8e58ffaf7902e8b6e4ec347a93d25a7c10d3579426d795'
            '037a21d6528344e25ec9f3057bb11b0b4a3f0114b9068c23ca15333f4e57bb50')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    # fix build when using ffmpeg git master
    # https://github.com/mpv-player/mpv/issues/5813
    patch -Np1 -i "${srcdir}/mpv-full-fix-build-with-ffmpeg-git.patch"
}

build() {
    cd "${_srcname}-${pkgver}"
    
    msg2 'Running bootstrap. Please wait...'
    ./bootstrap.py
    
    ./waf configure \
        --color='yes' \
        --prefix='/usr' \
        --progress \
        --confdir='/etc/mpv' \
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
        --disable-macos-touchbar
    
    ./waf build
}

package() {
    cd "${_srcname}-${pkgver}"
    
    ./waf install --destdir="$pkgdir"
    
    install -m644 DOCS/{encoding.rst,tech-overview.txt} "${pkgdir}/usr/share/doc/mpv"
}
