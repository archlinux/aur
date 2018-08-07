# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# To enable the Instrumentation and Tracing Technology API (ittnotify),
# firstly install the package intel-seapi and then build intel-media-sdk.
# It will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

_srcname=MediaSDK
pkgname=intel-media-sdk
pkgver=2018.Q2.1
pkgrel=6
epoch=1
pkgdesc='API to access hardware-accelerated video decode, encode and filtering on Intel platforms with integrated graphics'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=(
    # official repositories:
        'gcc-libs' 'libdrm' 'libva' 'wayland'
    # AUR:
        'intel-media-driver'
)
makedepends=('cmake' 'libpciaccess' 'libx11' 'libxcb')
provides=('libmfx')
conflicts=('intel-media-sdk-git' 'intel-media-stack-bin' 'intel-media-server-studio')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Intel-Media-SDK/MediaSDK/archive/MediaSDK-${pkgver/.Q/-Q}.tar.gz"
        'intel-media-sdk.conf'
        'intel-media-sdk.sh'
        'intel-media-sdk-fix-metrics-monitor.patch')
sha256sums=('cad29f3b034ca40f1a85748a9514bf53e035b432d434ea3e348e05bcb305e932'
            '0262233655f54fc1753ea71e36a569f9478c0905e67395246c85ad4a6d9e27c1'
            'de8c6dd5ac4db49a6d40d94b821bfca4b3480159863b4c1dfa0f21fdd6baeeb0'
            '5fa37a6919513ddfb8ab7b28b8ac83853c76cb66c40e12b082997fef7284ff4f')

prepare() {
    cd "MediaSDK-MediaSDK-${pkgver/.Q/-Q}"
    
    # fix ittnotify (intel-seapi) detection in the build system
    sed -i '/ITT_LIB/s/\$ENV{ITT_PATH}/$ENV{ITT_PATH}\/lib/' builder/FindVTune.cmake
    
    # fix build with glibc 2.28
    # https://github.com/Intel-Media-SDK/MediaSDK/issues/484
    patch -Np1 -i "${srcdir}/intel-media-sdk-fix-metrics-monitor.patch"
}

build() {
    cd "MediaSDK-MediaSDK-${pkgver/.Q/-Q}"
    
    export MFX_HOME="$(pwd)"
    export ITT_PATH='/usr'
    
    mkdir -p build
    cd build
    
    cmake \
        -G 'Unix Makefiles' \
        -D__GENERATOR:STRING='make' \
        -D__IPP:STRING='e9' \
        -D__TARGET_PLATFORM:STRING='BDW' \
        -DENABLE_DRM:BOOL='ON' \
        -DENABLE_OPENCL:BOOL='ON' \
        -DENABLE_WAYLAND:BOOL='ON' \
        -DENABLE_X11:BOOL='ON' \
        -DENABLE_X11_DRI3:BOOL='ON' \
        --no-warn-unused-cli \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "MediaSDK-MediaSDK-${pkgver/.Q/-Q}/build"
    
    make DESTDIR="$pkgdir" install
    
    # headers (add 'mfx' folder for ffmpeg compatibility)
    mkdir -p "${pkgdir}/opt/intel/mediasdk/include/mfx"
    cd "${pkgdir}/opt/intel/mediasdk/include"
    for _header in *.h
    do
        cd mfx
        ln -sf ../"$_header" "$_header"
        cd ..
    done
    
    # ld.so and profile configuration files
    cd "$srcdir"
    install -D -m644 intel-media-sdk.conf -t "${pkgdir}/etc/ld.so.conf.d"
    install -D -m755 intel-media-sdk.sh   -t "${pkgdir}/etc/profile.d"
    
    # license
    cd "${srcdir}/MediaSDK-MediaSDK-${pkgver/.Q/-Q}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
