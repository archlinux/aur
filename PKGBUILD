# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-compute-runtime-git
pkgver=19.21.13045.r47.gc0383491
pkgrel=1
pkgdesc='Intel(R) Graphics Compute Runtime for OpenCL(TM). Replaces Beignet for Gen8 (Broadwell) and beyond. (git version)'
arch=('x86_64')
url='https://01.org/compute-runtime/'
license=('MIT')
depends=('gcc-libs' 'intel-gmmlib' 'intel-graphics-compiler')
makedepends=('git' 'cmake' 'libva')
optdepends=('libva: for cl_intel_va_api_media_sharing'
            'libdrm: for cl_intel_va_api_media_sharing')
provides=('opencl-driver' 'intel-compute-runtime')
conflicts=('intel-compute-runtime')
source=('git+https://github.com/intel/compute-runtime.git')
sha256sums=('SKIP')

prepare() {
    mkdir -p build
}

pkgver() {
    cd compute-runtime
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd build
    cmake ../compute-runtime \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBDIR='lib' \
        -DNEO_DRIVER_VERSION="$pkgver"
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
    install -D -m644 "${srcdir}/compute-runtime/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
