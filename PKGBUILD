# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# To enable the Instrumentation and Tracing Technology API (ittnotify),
# firstly install the package intel-seapi and then build intel-media-sdk.
# It will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

_srcname=MediaSDK
pkgname=intel-media-sdk
pkgver=2018.Q2.1
pkgrel=1
epoch=1
pkgdesc='API to access hardware-accelerated video decode, encode and filtering on Intel platforms with integrated graphics'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=(
    # official repositories:
        'gcc-libs' 'libva' 'libdrm' 'wayland'
    # AUR:
        'intel-media-driver'
)
makedepends=('cmake' 'libx11' 'libxcb')
provides=('libmfx')
conflicts=('intel-media-sdk-git' 'intel-media-server-studio')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Intel-Media-SDK/MediaSDK/archive/MediaSDK-${pkgver/.Q/-Q}.tar.gz")
sha256sums=('cad29f3b034ca40f1a85748a9514bf53e035b432d434ea3e348e05bcb305e932')

prepare() {
    cd "MediaSDK-MediaSDK-${pkgver/.Q/-Q}"
    
    # fix ittnotify (intel-seapi) detection in the build system
    sed -i '/ITT_LIB/s/\$ENV{ITT_PATH}/$ENV{ITT_PATH}\/lib/' builder/FindVTune.cmake
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
        -DCMAKE_CONFIGURATION_TYPES:STRING='release;debug' \
        -DCMAKE_BUILD_TYPE:STRING='release' \
        -D__IPP:STRING='e9' \
        -D__TARGET_PLATFORM:STRING='BDW' \
        -DCMAKE_CXX_FLAGS_RELEASE:STRING="${CXXFLAGS} ${CPPFLAGS}" \
        -DCMAKE_C_FLAGS_RELEASE:STRING="${CFLAGS} ${CPPFLAGS}" \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
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
    
    # includes (add 'mfx' folder for ffmpeg compatibility)
    mkdir -p "${pkgdir}/opt/intel/mediasdk/include/mfx"
    cd "${pkgdir}/opt/intel/mediasdk/include"
    for _header in *.h
    do
        cd mfx
        ln -sf ../"$_header" "$_header"
        cd ..
    done
    
    # license
    cd "${srcdir}/MediaSDK-MediaSDK-${pkgver/.Q/-Q}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
