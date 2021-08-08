# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-compute-runtime-git
pkgver=21.31.20514.r93.gd81c637b9
pkgrel=1
pkgdesc='Intel(R) Graphics Compute Runtime for oneAPI Level Zero and OpenCL(TM) Driver (git version)'
arch=('x86_64')
url='https://01.org/compute-runtime/'
license=('MIT')
depends=('intel-gmmlib' 'intel-graphics-compiler-git')
makedepends=('git' 'cmake' 'igsc' 'libnl' 'libva' 'libxml2' 'level-zero-headers-git')
optdepends=('libva: for cl_intel_va_api_media_sharing'
            'libdrm: for cl_intel_va_api_media_sharing')
provides=('intel-compute-runtime' 'opencl-driver' 'level-zero-driver')
conflicts=('intel-compute-runtime')
source=('git+https://github.com/intel/compute-runtime.git'
        '010-intel-compute-runtime-fix-build.patch')
sha256sums=('SKIP'
            '4637efed691ab066fc76afad4651232fd426bf63e3078e79ce02299dc3be4e5c')

prepare() {
    patch -d compute-runtime -Np1 -i "${srcdir}/010-intel-compute-runtime-fix-build.patch"
}

pkgver() {
    git -C compute-runtime describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S compute-runtime \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 compute-runtime/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "$(find "${pkgdir}/usr/lib" -regex '.*libze_intel_gpu.so.[0-9]*' -exec basename {} +)" "${pkgdir}/usr/lib/libze_intel_gpu.so"
}
