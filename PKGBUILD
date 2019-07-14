# Maintainer: Daniel Bermond < gmail-com: danielbermond >

# To enable the Instrumentation and Tracing Technology API (ittnotify):
#   - install the package intel-seapi
#   - in build(), change '-DENABLE_ITT:BOOL=' from 'OFF' to 'ON'
#   - and then build intel-media-sdk-git
# intel-seapi will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

pkgname=intel-media-sdk-git
pkgver=2019.2.pre3.r106.g4108fee8
pkgrel=1
pkgdesc='API to access hardware-accelerated video decode, encode and filtering on Intel platforms with integrated graphics (git version)'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
depends=(
    # official repositories:
        'gcc-libs' 'libdrm' 'wayland' 'intel-media-driver'
    # AUR:
        'libva-git'
)
optdepends=('ocl-icd: for rotate_opencl plugin'
            'intel-compute-runtime: for rotate_opencl plugin')
makedepends=('git' 'git-lfs' 'cmake' 'libpciaccess' 'libx11' 'libxcb'
             'python' 'opencl-headers' 'ocl-icd' 'intel-compute-runtime')
provides=('intel-media-sdk' 'libmfx')
conflicts=('intel-media-sdk')
install="${pkgname}.install"
source=('git+https://github.com/Intel-Media-SDK/MediaSDK.git'
        'intel-media-sdk-git.conf'
        'intel-media-sdk-git.sh')
sha256sums=('SKIP'
            '63e76d28140486871a3ffc29ce19c84914583bf243201946c76943bf54df374a'
            '315ea6f304cf2b7b6a8aaabb0b8f71fcd480677c7fb9c8cbfa51c7830bb159bc')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    cd MediaSDK
    
    git lfs install --local
    git lfs pull "${source[0]/git+/}"
    
    mkdir -p build
}

pkgver() {
    cd MediaSDK
    
    local _prefix='intel-mediasdk-'
    
    # git, tags available
    git describe --long --tags | sed "s/^${_prefix}//;s/^[0-9]\{2\}/20&/;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

build() {
    cd MediaSDK/build
    
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
    cd MediaSDK/build
    
    make test
}

package() {
    cd MediaSDK/build
    
    make DESTDIR="$pkgdir" install
    
    # metrics_monitor
    install -D -m755 __bin/None/libcttmetrics.so -t "${pkgdir}/opt/intel/mediasdk/share/mfx/samples"
    install -D -m755 __bin/None/metrics_monitor  -t "${pkgdir}/opt/intel/mediasdk/share/mfx/samples"
    ln -s ../share/mfx/samples/libcttmetrics.so "${pkgdir}/opt/intel/mediasdk/lib64/libcttmetrics.so"
    
    # ld.so and profile configuration files
    cd "$srcdir"
    install -D -m644 intel-media-sdk-git.conf -t "${pkgdir}/etc/ld.so.conf.d"
    install -D -m755 intel-media-sdk-git.sh   -t "${pkgdir}/etc/profile.d"
    
    # license
    cd "${srcdir}/MediaSDK"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
