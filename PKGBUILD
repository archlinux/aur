# Maintainer: Daniel Bermond < gmail-com: danielbermond >

_srcname=compute-runtime
pkgname=intel-${_srcname}-git
pkgver=19.12.12612.r98.gcefa3e31
pkgrel=1
pkgdesc="Intel(R) Graphics Compute Runtime for OpenCL(TM). Replaces Beignet for Gen8 (Broadwell) and beyond. (git version)"
arch=(x86_64)
url="https://01.org/compute-runtime"
license=(MIT)
depends=(gcc-libs intel-gmmlib intel-graphics-compiler)
makedepends=(git cmake libva)
optdepends=('libva: for cl_intel_va_api_media_sharing'
            'libdrm: for cl_intel_va_api_media_sharing')
provides=(opencl-driver intel-compute-runtime)
conflicts=(intel-compute-runtime)
source=('git+https://github.com/intel/compute-runtime.git'
        'intel-compute-runtime-git-fix-ld.so-config.patch')
sha256sums=('SKIP'
            '08cedef03d3c3fe07360d3d5056f8054a13ecc0b92d3748ea61641f859f8bb44')

prepare() {
    mkdir -p build
    
    # fix path in ld.so config file
    cd "$_srcname"
    patch -Np1 -i "${srcdir}/intel-compute-runtime-git-fix-ld.so-config.patch"
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd build
    cmake ../${_srcname} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DNEO_DRIVER_VERSION=${pkgver}
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    install -Dm644 ../${_srcname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
