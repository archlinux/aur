# Maintainer: Foxe Chen <chen.foxe@gmail.com>
pkgname=libmpv-git
pkgver=v0.39.0.r929.gee07dcf
pkgrel=3
pkgdesc='a free, open source, and cross-platform media player (libmpv library only)'
arch=('x86_64')
license=('GPL-2.0-or-later')
url='https://mpv.io/'
depends=('alsa-lib' 'desktop-file-utils' 'ffmpeg' 'glibc' 'hicolor-icon-theme'
         'jack' 'lcms2' 'libarchive' 'libass' 'libbluray' 'libcdio'
         'libcdio-paranoia' 'libdrm' 'libdvdnav' 'libdvdread' 'libegl' 'libgl'
         'libglvnd' 'libjpeg-turbo' 'libplacebo' 'libpulse' 'libsixel' 'libva'
         'libvdpau' 'libx11' 'libxext' 'libxkbcommon' 'libxpresent' 'libxrandr'
         'libxss' 'libxv' 'luajit' 'mesa' 'mujs' 'libpipewire' 'rubberband'
         'openal' 'uchardet' 'vapoursynth' 'vulkan-icd-loader' 'wayland' 'zlib'
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
      git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
