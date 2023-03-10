# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# To enable the Instrumentation and Tracing Technology API (ittnotify):
#   - install the package intel-seapi
#   - in build(), change '-DENABLE_ITT:BOOL=' from 'OFF' to 'ON'
#   - and then build intel-media-sdk-git
# intel-seapi will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

pkgbase=intel-media-sdk-git
pkgname=('intel-media-sdk-git' 'libmfx-git')
pkgver=2023.1.3.r2.gaff8e8fa
pkgrel=1
pkgdesc='Legacy API for hardware video acceleration on Intel GPUs (Broadwell to Rocket Lake) (git version)'
arch=('x86_64')
url='https://software.intel.com/en-us/media-sdk/'
license=('MIT')
makedepends=('libdrm' 'libva-git' 'wayland' 'intel-media-driver'
             'git' 'git-lfs' 'cmake' 'libpciaccess' 'libx11' 'libxcb' 'python')
source=('git+https://github.com/Intel-Media-SDK/MediaSDK.git'
        '010-intel-media-sdk-fix-reproducible-build.patch'::'https://github.com/Intel-Media-SDK/MediaSDK/commit/f6925886f27a39eed2e43c5b7b6c342d00f7a970.patch')
sha256sums=('SKIP'
            'f1d8a4edf953cfec1516f1a8383c5ee033245aba16cfae0bc79b7de1a6365fcc')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    git -C MediaSDK lfs install --local
    git -C MediaSDK lfs pull "${source[0]/git+/}"
    patch -d MediaSDK -Np1 -i "${srcdir}/010-intel-media-sdk-fix-reproducible-build.patch"
}

pkgver() {
    git -C MediaSDK describe --long --tags | sed 's/^intel-mediasdk-//;s/^[0-9]\{2\}/20&/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S MediaSDK \
        -G 'Unix Makefiles' \
        -DBUILD_ALL:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_ITT:BOOL='OFF' \
        -DENABLE_OPENCL:BOOL='OFF' \
        -DENABLE_WAYLAND:BOOL='ON' \
        -DENABLE_X11_DRI3:BOOL='ON' \
        -DMFX_APPS_DIR='/usr/lib/mfx' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package_intel-media-sdk-git() {
    depends=('libdrm' 'libva-git' 'wayland' "libmfx-git=${pkgver}" 'intel-media-driver')
    provides=('intel-media-sdk' 'onevpl-runtime')
    conflicts=('intel-media-sdk')
    options=('!emptydirs')
    
    DESTDIR="$pkgdir" cmake --install build
    ln -s mfx/samples/libcttmetrics.so "${pkgdir}/usr/lib/libcttmetrics.so"
    install -D -m644 MediaSDK/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    [ -d 'libmfx' ] && rm -rf libmfx
    mkdir -p libmfx/usr/{include,lib/pkgconfig}
    mv "${pkgdir}/usr/include/mfx" libmfx/usr/include
    mv "${pkgdir}/usr/lib"/libmfx.so* libmfx/usr/lib
    mv "${pkgdir}/usr/lib/pkgconfig"/{,lib}mfx.pc libmfx/usr/lib/pkgconfig
}

package_libmfx-git() {
    pkgdesc='Intel Media SDK dispatcher library (git version)'
    depends=('gcc-libs')
    provides=('libmfx')
    conflicts=('libmfx')
    
    mv -T libmfx "$pkgdir"
    install -D -m644 MediaSDK/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
