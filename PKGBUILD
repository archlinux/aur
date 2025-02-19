# Maintainer: Foxe Chen <chen.foxe@gmail.com>
pkgname=libmpv-git
pkgver=0.39.0_859_gf9271fbffe
pkgrel=2
pkgdesc='a free, open source, and cross-platform media player (libmpv library only)'
arch=('x86_64')
license=('GPL-2.0-or-later')
url='https://mpv.io/'
depends=(
        'cmocka' 'lcms2' 'libcdio-paranoia' 'libgl' 'libplacebo' 'libxss'
        'libxinerama' 'libxv' 'libxkbcommon' 'libva' 'wayland' 'libcaca'
        'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'lua52' 'mujs'
        'libdvdnav' 'libxrandr' 'jack' 'rubberband' 'uchardet' 'libarchive'
        'zlib' 'vapoursynth' 'openal' 'vulkan-icd-loader' 'libxpresent'
        'libpipewire' 'zimg' 'sndio' 'libsixel' 'libdisplay-info' 'ffmpeg'
)
makedepends=('git' 'meson' 'mesa' 'ladspa' 'vulkan-headers'
             'wayland-protocols' 'ffnvcodec-headers')
provides=('mpv' 'mpv-git' 'libmpv.so')
conflicts=('mpv')
options=('!emptydirs')
source=('git+https://github.com/mpv-player/mpv.git')
sha256sums=('SKIP')

pkgver() {
      cd "$srcdir/mpv"
      git describe --always --tags --dirty | sed -e 's/^v//' -e 's/-/_/g'
}

build() {
    arch-meson mpv build \
        --auto-features auto \
        -Dgpl='true' \
        -Dcplayer='false' \
        -Dlibmpv='true' \
        -Dbuild-date='false' \
        -Dtests='false' \
        -Dfuzzers='false' \
        -Dgl-x11=enabled \
        -Dcaca=disabled \
        -Dcdda=enabled \
        -Ddvbin=enabled \
        -Ddvdnav=enabled \
        -Dlibarchive=enabled \
        -Dopenal=enabled \
        -Dhtml-build='disabled' \
        -Dmanpage-build='disabled' \
        -Dpdf-build='disabled'
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    # delete private entries only required for static linking
    sed -i -e '/Requires.private/d' -e '/Libs.private/d' "${pkgdir}/usr/lib/pkgconfig/mpv.pc"
}
