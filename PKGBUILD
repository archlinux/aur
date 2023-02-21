# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mpv-full
pkgver=0.35.1
pkgrel=2
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
        'libplacebo' 'libxpresent' 'libpipewire' 'zimg' 'sndio' 'libsixel'
    # AUR:
        'spirv-cross'
)
makedepends=('meson' 'mesa' 'python-docutils' 'ladspa' 'vulkan-headers'
             'wayland-protocols' 'ffnvcodec-headers')
optdepends=('yt-dlp: for video-sharing websites playback'
            'youtube-dl: for video-sharing websites playback'
            'nvidia-utils: for hardware accelerated video decoding with CUDA')
provides=('mpv')
conflicts=('mpv')
options=('!emptydirs')
source=("https://github.com/mpv-player/mpv/archive/v${pkgver}/mpv-${pkgver}.tar.gz")
sha256sums=('41df981b7b84e33a2ef4478aaf81d6f4f5c8b9cd2c0d337ac142fc20b387d1a9')

build() {
    arch-meson "mpv-${pkgver}" build \
        -Dgpl='true' \
        -Dcplayer='true' \
        -Dlibmpv='true' \
        -Dbuild-date='false' \
        -Dtests='false' \
        -Dta-leak-report='false' \
        \
        -Dcdda='enabled' \
        -Dcplugins='enabled' \
        -Ddvbin='enabled' \
        -Ddvdnav='enabled' \
        -Diconv='enabled' \
        -Djavascript='enabled' \
        -Dlcms2='enabled' \
        -Dlibarchive='enabled' \
        -Dlibavdevice='enabled' \
        -Dlibbluray='enabled' \
        -Dlua='auto' \
        \
        -Dpthread-debug='disabled' \
        -Drubberband='enabled' \
        -Dsdl2='enabled' \
        -Dsdl2-gamepad='enabled' \
        -Dstdatomic='enabled' \
        -Duchardet='enabled' \
        -Duwp='disabled' \
        -Dvapoursynth='enabled' \
        -Dvector='enabled' \
        -Dwin32-internal-pthreads='disabled' \
        -Dzimg='enabled' \
        -Dzlib='enabled' \
        \
        -Dalsa='enabled' \
        -Daudiounit='disabled' \
        -Dcoreaudio='disabled' \
        -Djack='enabled' \
        -Dopenal='enabled' \
        -Dopensles='disabled' \
        -Doss-audio='disabled' \
        -Dpipewire='enabled' \
        -Dpulse='enabled' \
        -Dsdl2-audio='enabled' \
        -Dsndio='enabled' \
        -Dwasapi='disabled' \
        \
        -Dcaca='enabled' \
        -Dcocoa='disabled' \
        -Dd3d11='disabled' \
        -Ddirect3d='disabled' \
        -Ddrm='enabled' \
        -Degl='enabled' \
        -Degl-android='disabled' \
        -Degl-angle='disabled' \
        -Degl-angle-lib='disabled' \
        -Degl-angle-win32='disabled' \
        -Degl-drm='enabled' \
        -Degl-wayland='enabled' \
        -Degl-x11='enabled' \
        -Dgbm='enabled' \
        -Dgl='enabled' \
        -Dgl-cocoa='disabled' \
        -Dgl-dxinterop='disabled' \
        -Dgl-win32='disabled' \
        -Dgl-x11='enabled' \
        -Djpeg='enabled' \
        -Dlibplacebo='enabled' \
        -Drpi='disabled' \
        -Dsdl2-video='enabled' \
        -Dshaderc='enabled' \
        -Dsixel='enabled' \
        -Dspirv-cross='enabled' \
        -Dplain-gl='enabled' \
        -Dvdpau='enabled' \
        -Dvdpau-gl-x11='enabled' \
        -Dvaapi='enabled' \
        -Dvaapi-drm='enabled' \
        -Dvaapi-wayland='enabled' \
        -Dvaapi-x11='enabled' \
        -Dvaapi-x-egl='enabled' \
        -Dvulkan='enabled' \
        -Dwayland='enabled' \
        -Dx11='enabled' \
        -Dxv='enabled' \
        \
        -Dandroid-media-ndk='disabled' \
        -Dcuda-hwaccel='enabled' \
        -Dcuda-interop='enabled' \
        -Dd3d-hwaccel='disabled' \
        -Dd3d9-hwaccel='disabled' \
        -Dgl-dxinterop-d3d9='disabled' \
        -Dios-gl='disabled' \
        -Drpi-mmal='disabled' \
        -Dvideotoolbox-gl='disabled' \
        \
        -Dmacos-10-11-features='disabled' \
        -Dmacos-10-12-2-features='disabled' \
        -Dmacos-10-14-features='disabled' \
        -Dmacos-cocoa-cb='disabled' \
        -Dmacos-media-player='disabled' \
        -Dmacos-touchbar='disabled' \
        -Dswift-build='disabled' \
        -Dswift-flags='disabled' \
        \
        -Dhtml-build='disabled' \
        -Dmanpage-build='enabled' \
        -Dpdf-build='disabled'
    ninja -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 "mpv-${pkgver}/DOCS"/{encoding.rst,tech-overview.txt} "${pkgdir}/usr/share/doc/mpv"
    install -D -m644 "mpv-${pkgver}/TOOLS/lua"/* -t "${pkgdir}/usr/share/mpv/scripts"
    
    # delete private entries only required for static linking
    sed -i -e '/Requires.private/d' -e '/Libs.private/d' "${pkgdir}/usr/lib/pkgconfig/mpv.pc"
}
