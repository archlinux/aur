# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# To enable the Instrumentation and Tracing Technology API (ittnotify):
#   - install the package intel-seapi
#   - in build(), change '-DENABLE_ITT:BOOL=' from 'OFF' to 'ON'
#   - and then build intel-media-sdk-git
# intel-seapi will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

pkgbase=intel-media-sdk-git
pkgname=('intel-media-sdk-git' 'libmfx-git')
pkgver=2020.3.pre6.r61.ge7b13633
pkgrel=1
pkgdesc='API to access hardware-accelerated video on Intel Gen graphics hardware platforms (git version)'
arch=('x86_64')
url='https://software.intel.com/en-us/media-sdk/'
license=('MIT')
makedepends=('libdrm' 'libva-git' 'wayland' 'intel-media-driver'
             'git' 'git-lfs' 'cmake' 'libpciaccess' 'libx11' 'libxcb' 'python'
             'opencl-headers' 'opencl-clhpp' 'ocl-icd' 'intel-compute-runtime')
source=('git+https://github.com/Intel-Media-SDK/MediaSDK.git')
sha256sums=('SKIP')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    git -C MediaSDK lfs install --local
    git -C MediaSDK lfs pull "${source[0]/git+/}"
}

pkgver() {
    git -C MediaSDK describe --long --tags | sed 's/^intel-mediasdk-//;s/^[0-9]\{2\}/20&/;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    depends=('libdrm' 'libva-git' 'wayland' "libmfx-git=${pkgver}" 'intel-media-driver')
    optdepends=('ocl-icd: for rotate_opencl plugin'
                'intel-compute-runtime: for rotate_opencl plugin')
    provides=('intel-media-sdk')
    conflicts=('intel-media-sdk')
    
    make -C build DESTDIR="$pkgdir" install
    ln -s ../share/mfx/samples/libcttmetrics.so "${pkgdir}/usr/lib/libcttmetrics.so"
    install -D -m644 MediaSDK/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # remove core component libmfx
    [ -d 'libmfx' ] && rm -rf libmfx
    mkdir -p libmfx/{include,lib/pkgconfig}
    mv "${pkgdir}/usr/include/mfx" libmfx/include
    mv "${pkgdir}/usr/lib/libmfx.so"* libmfx/lib
    mv "${pkgdir}/usr/lib/pkgconfig/"{,lib}mfx.pc libmfx/lib/pkgconfig
    rm -d "${pkgdir}/usr/include"
}

package_libmfx-git() {
    pkgdesc='Intel Media SDK dispatcher library (git version)'
    depends=('gcc-libs')
    provides=('libmfx')
    conflicts=('libmfx')
    
    mv libmfx "${pkgdir}/usr"
    install -D -m644 MediaSDK/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
