# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# To enable the Instrumentation and Tracing Technology API (ittnotify),
# firstly install the package intel-seapi and then build intel-media-sdk-git.
# It will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

pkgname=intel-media-sdk-git
pkgver=1.2a.r55.g22dae39
pkgrel=2
pkgdesc='API to access hardware-accelerated video decode, encode and filtering on Intel platforms with integrated graphics (git version)'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=(
    # official repositories:
        'gcc-libs' 'libva' 'libdrm' 'wayland'
    # AUR:
        'intel-media-driver-git'
)
makedepends=('git' 'git-lfs' 'cmake' 'libx11' 'libxcb')
options=('!emptydirs')
provides=('intel-media-sdk' 'libmfx')
conflicts=('intel-media-sdk' 'libmfx')

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
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/,//'
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
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_DRM:BOOL='ON' \
        -DENABLE_OPENCL:BOOL='ON' \
        -DENABLE_WAYLAND:BOOL='ON' \
        -DENABLE_X11:BOOL='ON' \
        -DENABLE_X11_DRI3:BOOL='ON' \
        -DMFX_PLUGINS_DIR='/usr/lib' \
        --no-warn-unused-cli \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${pkgname}/build"
    
    make DESTDIR="$pkgdir" install
    
    mkdir -p "${pkgdir}/usr/"{bin,include/mfx}
    
    # includes (add 'mfx' folder for ffmpeg compatibility)
    cd "${pkgdir}/usr/include"
    for _header in *.h
    do
        cd mfx
        ln -sf ../"$_header" "$_header"
        cd ..
    done
    
    # move samples to better places
    mv -f "$pkgdir"/usr/samples/lib* "${pkgdir}/usr/lib"
    mv -f "$pkgdir"/usr/samples/*    "${pkgdir}/usr/bin"
    
    # license
    cd "${srcdir}/${pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
