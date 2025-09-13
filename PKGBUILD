# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# To enable the Instrumentation and Tracing Technology API (ittnotify):
#   - install the package intel-seapi
#   - in build(), change '-DENABLE_ITT:BOOL=' from 'OFF' to 'ON'
#   - and then build intel-media-sdk-git
# intel-seapi will be autodetected by the build system, serving as a makedepend.
# Currently it will not be a mandatory makedepend.

pkgbase=intel-media-sdk-git
pkgname=('intel-media-sdk-git' 'libmfx-git')
pkgver=2023.2.2.r1.g7a72de33
pkgrel=6
pkgdesc='Legacy API for hardware video acceleration on Intel GPUs (Broadwell to Rocket Lake) (git version)'
arch=('x86_64')
url='https://github.com/Intel-Media-SDK/MediaSDK/'
license=('MIT')
makedepends=(
    'cmake'
    'git'
    'git-lfs'
    'intel-media-driver'
    'libdrm'
    'libpciaccess'
    'libva'
    'libx11'
    'libxcb'
    'python'
    'wayland')
source=('git+https://github.com/Intel-Media-SDK/MediaSDK.git'
        '010-intel-media-sdk-fix-reproducible-build.patch'::'https://github.com/Intel-Media-SDK/MediaSDK/pull/2688/commits/f6925886f27a39eed2e43c5b7b6c342d00f7a970.patch'
        '020-intel-media-sdk-libcttmetrics-static-only.patch'
        '030-intel-media-sdk-gcc13-fix.patch'
        '040-intel-media-sdk-gcc15-fix.patch')
sha256sums=('SKIP'
            'f1d8a4edf953cfec1516f1a8383c5ee033245aba16cfae0bc79b7de1a6365fcc'
            'a473fd7dbd3c7240a3511471cfad6a39dc462b102c88cd23c35e25f2e8ec0246'
            '38fc06cdc31372d26f1dc2a7e5b1ea57c22f8f83fbf84e0af5638a8040aa7f4e'
            '4a7bab16e6d90f1f6e4a365328c0edd08dd8ea02d38687fcb0c2248bb69171d2')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    git -C MediaSDK lfs install --local
    git -C MediaSDK lfs pull "${source[0]/git+/}"
    patch -d MediaSDK -Np1 -i "${srcdir}/010-intel-media-sdk-fix-reproducible-build.patch"
    patch -d MediaSDK -Np1 -i "${srcdir}/020-intel-media-sdk-libcttmetrics-static-only.patch"
    patch -d MediaSDK -Np1 -i "${srcdir}/030-intel-media-sdk-gcc13-fix.patch"
    patch -d MediaSDK -Np1 -i "${srcdir}/040-intel-media-sdk-gcc15-fix.patch"
}

pkgver() {
    git -C MediaSDK describe --long --tags | sed 's/^intel-mediasdk-//;s/^[0-9]\{2\}/20&/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export CFLAGS+=' -DNDEBUG -ffat-lto-objects'
    export CXXFLAGS+=' -DNDEBUG -ffat-lto-objects'
    cmake -B build -S MediaSDK \
        -G 'Unix Makefiles' \
        -DBUILD_ALL:BOOL='ON' \
        -DBUILD_TOOLS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
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
    depends=(
        'gcc-libs'
        'glibc'
        'intel-media-driver'
        'libdrm'
        "libmfx-git=${pkgver}"
        'libva'
        'wayland')
    provides=('intel-media-sdk' 'vpl-runtime')
    conflicts=('intel-media-sdk')
    options=('!emptydirs')
    
    DESTDIR="$pkgdir" cmake --install build
    mv "${pkgdir}/usr/lib/libcttmetrics.a" "${pkgdir}/usr/lib/mfx/samples"
    install -D -m644 MediaSDK/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    [ -d 'libmfx' ] && rm -rf libmfx
    mkdir -p libmfx/usr/{include,lib/pkgconfig}
    mv "${pkgdir}/usr/include/mfx" libmfx/usr/include
    mv "${pkgdir}/usr/lib"/libmfx.so* libmfx/usr/lib
    mv "${pkgdir}/usr/lib/pkgconfig"/{,lib}mfx.pc libmfx/usr/lib/pkgconfig
}

package_libmfx-git() {
    pkgdesc='Intel Media SDK dispatcher library (git version)'
    depends=(
        'gcc-libs'
        'glibc')
    provides=('libmfx')
    conflicts=('libmfx')
    
    mv -T libmfx "$pkgdir"
    install -D -m644 MediaSDK/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
