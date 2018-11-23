# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=gst-plugins-intel-msdk-git
_srcname=gstreamer-media-SDK
pkgver=1.3.3.rc9.r44.g1aae2ee
pkgrel=2
pkgdesc='GStreamer plugins for Intel Media SDK (MSDK) (git version)'
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
makedepends=('git' 'cmake')
provides=('gst-plugins-intel-msdk')
conflicts=('gst-plugins-intel-msdk')
source=('git+https://github.com/intel/gstreamer-media-SDK.git'
        'gst-plugins-intel-msdk-git-fix-intel-media-sdk-directories.patch'
        'gst-plugins-intel-msdk-git-fix-link-and-install.patch')
sha256sums=('SKIP'
            '9fd317b93395faa95eae10bb9bf77e1828d942b83f5b4ba768144c8a23f3cbec'
            'fc410ebcb456894e084b3705ddb5deceede0cb7977206e89cc7b86c29d011fe0')

prepare() {
    cd "$_srcname"
    
    mkdir -p build
    
    patch -Np1 -i "${srcdir}/gst-plugins-intel-msdk-git-fix-intel-media-sdk-directories.patch"
    patch -Np1 -i "${srcdir}/gst-plugins-intel-msdk-git-fix-link-and-install.patch"
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/_/\./'
}

build() {
    cd "$_srcname"
    
    cd build
    
    cmake \
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
    cd "${_srcname}/build"
    
    make DESTDIR="$pkgdir" install
}
