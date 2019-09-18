# Maintainer: Daniel Bermond < gmail-com: danielbermond >

# To enable the Instrumentation and Tracing Technology API (ittnotify):
#   - install the package intel-seapi
#   - in build(), change '-DENABLE_ITT:BOOL=' from 'OFF' to 'ON'
#   - and then build intel-media-sdk
# intel-seapi will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

pkgname=intel-media-sdk
pkgver=2019.2.1
_srcver="${pkgver:2}"
pkgrel=4
epoch=1
pkgdesc='API to access hardware-accelerated video decode, encode and filtering on Intel platforms with integrated graphics'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=('gcc-libs' 'libdrm' 'libva' 'wayland' 'intel-media-driver')
optdepends=('ocl-icd: for rotate_opencl plugin'
            'intel-compute-runtime: for rotate_opencl plugin')
makedepends=('cmake' 'libpciaccess' 'libx11' 'libxcb' 'python'
             'opencl-headers' 'ocl-icd' 'intel-compute-runtime')
provides=('libmfx')
install="${pkgname}.install"
source=("https://github.com/Intel-Media-SDK/MediaSDK/archive/intel-mediasdk-${_srcver}.tar.gz"
        'intel-media-sdk.conf'
        'intel-media-sdk.sh')
sha256sums=('03c11a0379b61e292e789fa3dc9308ce45f36d68b4ebf437806c0e2c32357970'
            '12a37e6e12d93fac5829082773b9f010a3c6c763ddeee177618b8e1a0547fbbc'
            '315ea6f304cf2b7b6a8aaabb0b8f71fcd480677c7fb9c8cbfa51c7830bb159bc')

prepare() {
       mkdir -p "MediaSDK-intel-mediasdk-${_srcver}/build"
}

build() {
    cd "MediaSDK-intel-mediasdk-${_srcver}/build"
    
    cmake \
        -DCMAKE_BUILD_TYPE='None' \
        -DBUILD_ALL:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='ON' \
        -DENABLE_ITT:BOOL='OFF' \
        -DENABLE_OPENCL:BOOL='ON' \
        -DENABLE_WAYLAND:BOOL='ON' \
        -DENABLE_X11_DRI3:BOOL='ON' \
        -Wno-dev \
        ..
        
    make
}

check() {
    cd "MediaSDK-intel-mediasdk-${_srcver}/build"
    
    make test
}

package() {
    cd "MediaSDK-intel-mediasdk-${_srcver}/build"
    
    make DESTDIR="$pkgdir" install
    
    # metrics_monitor
    install -D -m755 __bin/None/libcttmetrics.so -t "${pkgdir}/opt/intel/mediasdk/share/mfx/samples"
    install -D -m755 __bin/None/metrics_monitor  -t "${pkgdir}/opt/intel/mediasdk/share/mfx/samples"
    ln -s ../share/mfx/samples/libcttmetrics.so "${pkgdir}/opt/intel/mediasdk/lib/libcttmetrics.so"
    
    # ld.so and profile configuration files
    cd "$srcdir"
    install -D -m644 intel-media-sdk.conf -t "${pkgdir}/etc/ld.so.conf.d"
    install -D -m755 intel-media-sdk.sh   -t "${pkgdir}/etc/profile.d"
    
    # license
    cd "${srcdir}/MediaSDK-intel-mediasdk-${_srcver}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
