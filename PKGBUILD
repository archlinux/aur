# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=gst-plugins-intel-msdk
_srcname=gstreamer-media-SDK
pkgver=1.3.3.rc9
_rc="${pkgver##*.}"
_srcver="${pkgver/.${_rc}/-${_rc}}"
pkgrel=1
pkgdesc='GStreamer plugins for Intel Media SDK (MSDK)'
arch=('x86_64')
url='https://github.com/intel/gstreamer-media-SDK/'
license=('LGPL2.1')
depends=(
    # official repositories:
        'gcc-libs' 'libsystemd' 'gstreamer' 'gst-plugins-base-libs'
        'gst-plugins-bad' 'glib2' 'libdrm' 'libva' 'libgl' 'wayland'
        'libxrandr' 'libxcb' 'libxkbcommon'
    # AUR:
        'intel-media-sdk'
)
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/intel/gstreamer-media-SDK/archive/v${pkgver%.${_rc}*}-${_rc}.tar.gz"
        'gst-plugins-intel-msdk-fix-intel-media-sdk-directories.patch'
        'gst-plugins-intel-msdk-fix-libdrm-include-directory.patch'
        'gst-plugins-intel-msdk-fix-link-and-install.patch')
sha256sums=('a83351dbd62f3dd1621b2013a11b3e7e52d0d98dc0c1ac9a191ac92819071fe3'
            'd7c521d9308d2dbed770caff81031c663b4af384deb237fde8cf4b2c36759da5'
            'b55a8a8785ce2292c2792ffc814f004e8bd05b8d70e4e14a2fd93924901c020e'
            '01101e5c68e8b199004d23550b59f6481286d4f4660739098f4a389eaca8734b')

prepare() {
    cd "${_srcname}-${_srcver}"
    
    mkdir -p build
    
    patch -Np1 -i "${srcdir}/gst-plugins-intel-msdk-fix-intel-media-sdk-directories.patch"
    patch -Np1 -i "${srcdir}/gst-plugins-intel-msdk-fix-libdrm-include-directory.patch"
    patch -Np1 -i "${srcdir}/gst-plugins-intel-msdk-fix-link-and-install.patch"
}

build() {
    cd "${_srcname}-${_srcver}"
    
    cd build
    
    cmake \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
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
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${_srcname}-${_srcver}/build"
    
    make DESTDIR="$pkgdir" install
}
