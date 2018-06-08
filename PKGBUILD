# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# To enable the Instrumentation and Tracing Technology API (ittnotify),
# firstly install the package intel-seapi and then build intel-media-sdk-git.
# It will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

pkgname=intel-media-sdk-git
pkgver=2018.Q2.1.r69.gc34cc32
pkgrel=1
pkgdesc='API to access hardware-accelerated video decode, encode and filtering on Intel platforms with integrated graphics (git version)'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=(
    # official repositories:
        'gcc-libs' 'libva' 'libdrm' 'wayland'
    # AUR:
        'intel-media-driver'
)
makedepends=('git' 'git-lfs' 'cmake' 'libx11' 'libxcb')
provides=('intel-media-sdk' 'libmfx')
conflicts=('intel-media-sdk' 'intel-media-server-studio')
options=('!emptydirs')

prepare() {
    # makepkg does not support cloning git-lfs repositories
    if [ -d "$pkgname" ] 
    then
        msg2 "Updating '${pkgname}' git repo..."
        cd "$pkgname"
        git pull origin
    else
        msg2 "Cloning '${pkgname}' git repo..."
        git lfs install
        git clone https://github.com/Intel-Media-SDK/MediaSDK.git "$pkgname"
        cd "$pkgname"
    fi
    
    # fix ittnotify (intel-seapi) detection in the build system
    sed -i '/ITT_LIB/s/\$ENV{ITT_PATH}/$ENV{ITT_PATH}\/lib/' builder/FindVTune.cmake
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    local _prefix='MediaSDK-'
    git describe --long --tags | sed "s/^${_prefix}//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/,//"
}

build() {
    cd "$pkgname"
    
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
    cd "${pkgname}/build"
    
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
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
