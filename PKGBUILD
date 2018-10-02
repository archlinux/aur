# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# To enable the Instrumentation and Tracing Technology API (ittnotify):
#   - install the package intel-seapi
#   - in build(), change '-DENABLE_ITT:BOOL=' from 'OFF' to 'ON'
#   - and then build intel-media-sdk
# intel-seapi will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

pkgname=intel-media-sdk
pkgver=2018.3.0
_srcver="$(printf '%s' "$pkgver" | sed -E 's/(^[0-9]{2})([0-9]{2})/\2/')"
pkgrel=1
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
makedepends=('cmake' 'libpciaccess' 'libx11' 'libxcb' 'gtest')
provides=('libmfx')
conflicts=('intel-media-sdk-git' 'intel-media-stack-bin' 'intel-media-server-studio')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Intel-Media-SDK/MediaSDK/archive/intel-mediasdk-${_srcver}.tar.gz"
        'intel-media-sdk.conf'
        'intel-media-sdk.sh')
sha256sums=('46958c0dd15cca3d1939260918d48aa8f655c41d7fa265a76dd200ae62a144af'
            '63e76d28140486871a3ffc29ce19c84914583bf243201946c76943bf54df374a'
            '315ea6f304cf2b7b6a8aaabb0b8f71fcd480677c7fb9c8cbfa51c7830bb159bc')

build() {
    cd "MediaSDK-intel-mediasdk-${_srcver}"
    
    mkdir -p build
    cd build
    
    cmake \
        -DBUILD_ALL:BOOL='ON' \
        -DBUILD_DISPATCHER:BOOL='ON' \
        -DBUILD_RUNTIME:BOOL='ON' \
        -DBUILD_SAMPLES:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='ON' \
        -DENABLE_ALL:BOOL='ON' \
        -DENABLE_ITT:BOOL='OFF' \
        -DENABLE_OPENCL:BOOL='ON' \
        -DENABLE_STAT:BOOL='OFF' \
        -DENABLE_TEXTLOG:BOOL='OFF' \
        -DENABLE_WAYLAND:BOOL='ON' \
        -DENABLE_X11_DRI3:BOOL='ON' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "MediaSDK-intel-mediasdk-${_srcver}/build"
    
    make DESTDIR="$pkgdir" install
    
    # ld.so and profile configuration files
    cd "$srcdir"
    install -D -m644 intel-media-sdk.conf -t "${pkgdir}/etc/ld.so.conf.d"
    install -D -m755 intel-media-sdk.sh   -t "${pkgdir}/etc/profile.d"
    
    # license
    cd "${srcdir}/MediaSDK-intel-mediasdk-${_srcver}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
