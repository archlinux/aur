# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# To enable the Instrumentation and Tracing Technology API (ittnotify):
#   - install the package intel-seapi
#   - in build(), change '-DENABLE_ITT:BOOL=' from 'OFF' to 'ON'
#   - and then build intel-media-sdk-git
# intel-seapi will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

pkgbase=intel-media-sdk-git
pkgname=('intel-media-sdk-git' 'libmfx-git')
pkgver=2019.4.pre2.r121.g2c3a4551
pkgrel=1
pkgdesc='API to access hardware-accelerated video on Intel Gen graphics hardware platforms (git version)'
arch=('x86_64')
url='https://software.intel.com/en-us/media-sdk/'
license=('MIT')
makedepends=('libdrm' 'libva-git' 'wayland' 'intel-media-driver'
             'git' 'git-lfs' 'cmake' 'libpciaccess' 'libx11' 'libxcb' 'python'
             'opencl-headers' 'ocl-icd' 'intel-compute-runtime')
source=('git+https://github.com/Intel-Media-SDK/MediaSDK.git')
sha256sums=('SKIP')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    cd MediaSDK
    git lfs install --local
    git lfs pull "${source[0]/git+/}"
}

pkgver() {
    cd MediaSDK
    local _prefix='intel-mediasdk-'
    git describe --long --tags | sed "s/^${_prefix}//;s/^[0-9]\{2\}/20&/;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

build() {
    cmake -B build -S MediaSDK \
        -DBUILD_ALL:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_ITT:BOOL='OFF' \
        -DENABLE_OPENCL:BOOL='ON' \
        -DENABLE_WAYLAND:BOOL='ON' \
        -DENABLE_X11_DRI3:BOOL='ON' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package_intel-media-sdk-git() {
    depends=('gcc-libs' 'libdrm' 'libva-git' 'wayland' "libmfx-git=${pkgver}" 'intel-media-driver')
    optdepends=('ocl-icd: for rotate_opencl plugin'
                'intel-compute-runtime: for rotate_opencl plugin')
    provides=('intel-media-sdk')
    conflicts=('intel-media-sdk')
    
    make -C build DESTDIR="$pkgdir" install
    
    ln -s ../share/mfx/samples/libcttmetrics.so "${pkgdir}/usr/lib/libcttmetrics.so"
    
    # remove core component libmfx
    [ -d 'libmfx' ] && rm -rf libmfx
    mkdir -p libmfx/lib/pkgconfig
    mv "${pkgdir}/usr/include" libmfx
    mv "${pkgdir}/usr/lib/libmfx.so"* libmfx/lib
    mv "${pkgdir}/usr/lib/pkgconfig/"{,lib}mfx.pc libmfx/lib/pkgconfig
    
    install -D -m644 MediaSDK/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_libmfx-git() {
    pkgdesc='Intel Media SDK dispatcher library (git version)'
    depends=('gcc-libs')
    provides=('libmfx')
    conflicts=('libmfx')
    
    # install core component libmfx into a separated package
    mkdir -p "${pkgdir}/usr"
    mv libmfx/{include,lib} "${pkgdir}/usr"
    
    install -D -m644 MediaSDK/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
