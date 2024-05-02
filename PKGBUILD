# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=vpl-gpu-rt-git
pkgver=24.2.2.r4.g4a124799
pkgrel=1
pkgdesc='Intel VPL runtime implementation for Intel GPUs (Tiger Lake and newer) (git version)'
arch=('x86_64')
url='https://github.com/intel/vpl-gpu-rt/'
license=('MIT')
depends=('intel-media-driver' 'libdrm' 'libva')
makedepends=('git' 'cmake')
provides=('vpl-gpu-rt' 'onevpl-intel-gpu' 'vpl-runtime')
conflicts=('vpl-gpu-rt' 'onevpl-intel-gpu')
replaces=('onevpl-intel-gpu-git')
source=('git+https://github.com/intel/vpl-gpu-rt.git'
        '010-vpl-gpu-rt-disable-verbose-makefile.patch')
sha256sums=('SKIP'
            'c6b17b7026d16d02c3cab7b5081366c24021a86fa173eaee5db310691ce76879')

prepare() {
    patch -d vpl-gpu-rt -Np1 -i "${srcdir}/010-vpl-gpu-rt-disable-verbose-makefile.patch"
}

pkgver() {
    git -C vpl-gpu-rt describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/intel\.onevpl\.//;s/^v//'
}

build() {
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S vpl-gpu-rt \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTS:BOOL='OFF' \
        -DMFX_ENABLE_AENC:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 vpl-gpu-rt/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
