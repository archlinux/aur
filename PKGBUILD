# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Maintainer: William Boulanger <willbou2 at gmail.com>
# Contributor: Marko Korhonen <reekymarko at reekynet.com>
# Contributor: Bruno Filipe < gmail-com: bmilreu >
# Original: Daniel Bermond <dbermond@archlinux.org> https://aur.archlinux.org/packages/mpv-full-git

pkgname=mpv-amd-full-git
pkgver=0.35.1.r348.g0f13c38e72
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
        'libxpresent' 'pipewire' 'zimg' 'ffmpeg' 'sndio' 'libsixel'
    # AUR:
        'spirv-cross' 'libplacebo-git'
)
makedepends=('git' 'mesa' 'python-docutils' 'ladspa' 'vulkan-headers'
             'wayland-protocols' 'meson')
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
    arch-meson mpv build \
        -Dgpl='true' \
        -Dcplayer='true' \
        -Dlibmpv='true' \
        -Dbuild-date='false' \
        -Dtests='true' \
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
        -Dlibplacebo-next='enabled' \
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
        -Dcuda-hwaccel='disabled' \
        -Dcuda-interop='disabled' \
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

check() {
    cd build
    meson test
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 mpv/DOCS/{encoding.rst,tech-overview.txt} "${pkgdir}/usr/share/doc/mpv"
    install -D -m644 mpv/TOOLS/lua/* -t "${pkgdir}/usr/share/mpv/scripts"
    
    # delete private entries only required for static linking
    sed -i -e '/Requires.private/d' -e '/Libs.private/d' "${pkgdir}/usr/lib/pkgconfig/mpv.pc"
}
