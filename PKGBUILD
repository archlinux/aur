# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# To enable the Instrumentation and Tracing Technology API (ittnotify),
# firstly install the package intel-seapi and then build intel-media-sdk.
# It will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

_srcname=MediaSDK
pkgname=intel-media-sdk
pkgver=1.3a
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
conflicts=('intel-media-sdk' 'intel-media-server-studio')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Intel-Media-SDK/MediaSDK/archive/${pkgver}.tar.gz"
        'intel-media-sdk-libva-2.1-fix.patch'
        'intel-media-sdk-add-generation-summary.patch'
        'intel-media-sdk-do-not-override-user-supplied-compile-flags.patch'
        'intel-media-sdk-avoid-forcing-cmake-verbose-makefile.patch')
sha256sums=('6c384d019dc47718170a080f652cf1f1b5c48bbd6eeffbaeda0b39ee3d6f437b'
            '82571e0897eb2e1b7b1a05115e8ff3584d63dd8e77e990e4091d013067a06e69'
            'd950465b1f855c64f8e1b058dafc89e06e7bf0ca721e946a6b67210cbc7f4356'
            'd3dab068faa79db3b940d976ff4a0c9cb2f2cd2fe1bcc67e0b995cfa73808733'
            '5b1babf0d4637c4785d7680ec9082a0678c8776f5740202e55edf8f3e7d565d6')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    patch -Np1 -i "${srcdir}/intel-media-sdk-libva-2.1-fix.patch"
    patch -Np1 -i "${srcdir}/intel-media-sdk-add-generation-summary.patch"
    patch -Np1 -i "${srcdir}/intel-media-sdk-do-not-override-user-supplied-compile-flags.patch"
    patch -Np1 -i "${srcdir}/intel-media-sdk-avoid-forcing-cmake-verbose-makefile.patch"
    
    # fix ittnotify (intel-seapi) detection in the build system
    sed -i '/ITT_LIB/s/\$ENV{ITT_PATH}/$ENV{ITT_PATH}\/lib/' builder/FindVTune.cmake
}

build() {
    cd "${_srcname}-${pkgver}"
    
    export MFX_HOME="$(pwd)"
    export ITT_PATH='/usr'
    
    mkdir -p build
    cd build
    
    cmake \
        -G 'Unix Makefiles' \
        -D__GENERATOR:STRING='make' \
        -DCMAKE_CONFIGURATION_TYPES:STRING='release;debug' \
        -DCMAKE_BUILD_TYPE:STRING='release' \
        -D__ARCH:STRING='intel64' \
        -D__CONFIG:STRING='release' \
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
    cd "${_srcname}-${pkgver}/build"
    
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
    
    # create symlinks for ffmpeg compatibility
    # (currently it seems to needed only on the intel-media-sdk "stable" version package)
    mkdir -p "${pkgdir}/usr/lib"
    cd "${pkgdir}/usr/lib"
    ln -s ../../opt/intel/mediasdk/lib64/*.so    "${pkgdir}/usr/lib"
    ln -s ../../opt/intel/mediasdk/plugins/*.so  "${pkgdir}/usr/lib"
    ln -s ../../opt/intel/mediasdk/plugins/*.cfg "${pkgdir}/usr/lib"
    
    # license
    cd "${srcdir}/${_srcname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
