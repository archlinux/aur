# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libvpl-git
pkgver=2.12.0.r0.g0c13c41
pkgrel=1
pkgdesc='Intel Video Processing Library (git version)'
arch=('x86_64')
url='https://intel.github.io/libvpl/'
license=('MIT')
depends=('gcc-libs')
optdepends=('intel-media-sdk: runtime implementation for legacy Intel GPUs'
            'vpl-gpu-rt: runtime implementation for Tiger Lake and newer GPUs')
makedepends=('git' 'cmake')
provides=('libvpl' 'onevpl' 'libvpl.so')
conflicts=('libvpl' 'onevpl')
replaces=('onevpl-git')
options=('!emptydirs')
source=('git+https://github.com/intel/libvpl.git')
sha256sums=('SKIP')

pkgver() {
    git -C libvpl describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    export CFLAGS+=' -DNDEBUG'
    export CXXFLAGS+=' -DNDEBUG'
    cmake -B build -S libvpl \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_SYSCONFDIR:PATH='/etc' \
        -DBUILD_EXAMPLES:BOOL='OFF' \
        -DBUILD_TESTS:BOOL='ON' \
        -DVPL_INSTALL_LICENSEDIR:PATH="share/licenses/${pkgname}" \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    rm -r "${pkgdir}/usr/share/vpl/examples"
    rm "${pkgdir}/"{etc/vpl/vars.sh,usr/include/vpl/preview/{,legacy/}README.txt}
}
