# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gst-plugins-intel-msdk-git
pkgver=1.3.3.rc9.r78.g6ab2418
pkgrel=1
pkgdesc='GStreamer plugins for Intel Media SDK (MSDK) (git version)'
arch=('x86_64')
url='https://github.com/intel/gstreamer-media-SDK/'
license=('LGPL2.1')
depends=('gcc-libs' 'libsystemd' 'gstreamer' 'gst-plugins-base-libs'
         'gst-plugins-bad' 'glib2' 'intel-media-sdk' 'libdrm' 'libva'
         'libgl' 'wayland' 'libxrandr' 'libxcb' 'libxkbcommon')
makedepends=('git' 'cmake')
provides=('gst-plugins-intel-msdk')
conflicts=('gst-plugins-intel-msdk')
options=('!lto')
source=('git+https://github.com/intel/gstreamer-media-SDK.git'
        '010-gst-plugins-intel-msdk-fix-intel-media-sdk-directories.patch'
        '020-gst-plugins-intel-msdk-fix-link-and-install.patch'
        '030-gst-plugins-intel-msdk-fix-for-gst-plugins-bad-1.18.patch'::'https://github.com/intel/gstreamer-media-SDK/commit/56a6e15db043f98c40366f01adf1f4b3f0fba2eb.patch')
sha256sums=('SKIP'
            '3481788e701b77c1abb3d2106ebc67756d50fbb0125a2a76645ffc9eb062d296'
            'b585d73d0cdb6ebef14a5353dcef81fa011373972ea86fcf980c05f353d06d70'
            'ec25afeb0008989e04cba225bad67a8db5d0e034b97257c0e0a85813867ad23d')

prepare() {
    patch -d gstreamer-media-SDK -Np1 -i "${srcdir}/010-gst-plugins-intel-msdk-fix-intel-media-sdk-directories.patch"
    patch -d gstreamer-media-SDK -Np1 -i "${srcdir}/020-gst-plugins-intel-msdk-fix-link-and-install.patch"
    patch -d gstreamer-media-SDK -Np1 -i "${srcdir}/030-gst-plugins-intel-msdk-fix-for-gst-plugins-bad-1.18.patch"
}

pkgver() {
    git -C gstreamer-media-SDK describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/_/\./'
}

build() {
    cmake -B build -S gstreamer-media-SDK \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DMFX_DECODER='ON' \
        -DUSE_HEVC_DECODER='ON' \
        -DUSE_HEVC_10BIT_DECODER='ON' \
        -DUSE_VP8_DECODER='ON' \
        -DUSE_VP9_DECODER='ON' \
        -DMFX_ENCODER='ON' \
        -DMFX_H264_ENCODER='ON' \
        -DMFX_H265_ENCODER='ON' \
        -DMFX_MPEG2_ENCODER='ON' \
        -DMFX_JPEG_ENCODER='ON' \
        -DMFX_VPP='ON' \
        -DMFX_SINK='ON' \
        -DWITH_WAYLAND='ON' \
        -DWITH_X11='ON' \
        -DUSE_WAYLAND_RENDERER='ON' \
        -DUSE_DRI3_RENDERER='ON' \
        -DUSE_EGL_RENDERER='ON' \
        -DMFX_SINK_BIN='ON' \
        -DWITH_MSS_2016='OFF' \
        -DMFX_VC1_PARSER='ON' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
