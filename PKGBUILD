# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gst-plugins-intel-msdk
pkgver=1.3.3.rc9
pkgrel=3
pkgdesc='GStreamer plugins for Intel Media SDK (MSDK)'
arch=('x86_64')
url='https://github.com/intel/gstreamer-media-SDK/'
license=('LGPL2.1')
depends=('gcc-libs' 'libsystemd' 'gstreamer' 'gst-plugins-base-libs'
         'gst-plugins-bad' 'glib2' 'intel-media-sdk' 'libdrm' 'libva'
         'libgl' 'wayland' 'libxrandr' 'libxcb' 'libxkbcommon')
makedepends=('cmake')
options=('!lto')
source=("https://github.com/intel/gstreamer-media-SDK/archive/v${pkgver/.rc/-rc}/${pkgname}-${pkgver}.tar.gz"
        '010-gst-plugins-intel-msdk-fix-intel-media-sdk-directories.patch'
        '020-gst-plugins-intel-msdk-fix-libdrm-include-directory.patch'
        '030-gst-plugins-intel-msdk-fix-link-and-install.patch'
        '040-gst-plugins-intel-msdk-fix-for-gst-plugins-bad-1.18.patch'::'https://github.com/intel/gstreamer-media-SDK/commit/56a6e15db043f98c40366f01adf1f4b3f0fba2eb.patch')
sha256sums=('a83351dbd62f3dd1621b2013a11b3e7e52d0d98dc0c1ac9a191ac92819071fe3'
            '084dc93746b5a861540e72af6d5d02ee23f08480859e5231f6d6080e556014d5'
            'cf2adc3643e7ada0d0c0f096cc303daa131eb75a272b16a36b95c4753fa293ef'
            '09756c986dda896a58ac0438531dd22686298a10ff450703830a79396197fd3b'
            'ec25afeb0008989e04cba225bad67a8db5d0e034b97257c0e0a85813867ad23d')

prepare() {
    patch -d "gstreamer-media-SDK-${pkgver/.rc/-rc}" -Np1 -i "${srcdir}/010-gst-plugins-intel-msdk-fix-intel-media-sdk-directories.patch"
    patch -d "gstreamer-media-SDK-${pkgver/.rc/-rc}" -Np1 -i "${srcdir}/020-gst-plugins-intel-msdk-fix-libdrm-include-directory.patch"
    patch -d "gstreamer-media-SDK-${pkgver/.rc/-rc}" -Np1 -i "${srcdir}/030-gst-plugins-intel-msdk-fix-link-and-install.patch"
    patch -d "gstreamer-media-SDK-${pkgver/.rc/-rc}" -Np1 -i "${srcdir}/040-gst-plugins-intel-msdk-fix-for-gst-plugins-bad-1.18.patch"
}

build() {
    cmake -B build -S "gstreamer-media-SDK-${pkgver/.rc/-rc}" \
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
