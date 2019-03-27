# Maintainer luspi <luspi __at_ gmx (dot) de>

pkgname=oclgrind
pkgver=18.3
pkgrel=1

pkgdesc="A SPIR interpreter and virtual OpenCL device simulator."
arch=("any")
url="https://github.com/jrprice/Oclgrind"
makedepends=("cmake")
depends=("clang" "llvm")
license=("BSD")
conflicts=("oclgrind-git")

source=("https://github.com/jrprice/Oclgrind/archive/v${pkgver}.zip"
        "llvm.patch")

md5sums=('318c04961748fc2512f1a34d0db4e3a0'
         '2a18b6acd4c31b967a9755be7d1c0b87')

prepare() {
    cd "${srcdir}/Oclgrind-${pkgver}/"
    patch --forward --input="${srcdir}/llvm.patch"
}

build() {
    cd "${srcdir}/Oclgrind-${pkgver}"
    mkdir -p build && cd build/
    cmake .. -DCMAKE_BUILD_TYPE=Release \
             -DCMAKE_INSTALL_PREFIX=/usr \
             -DLIBDIR_SUFFIX=""
    make
}

package() {
    cd "${srcdir}/Oclgrind-${pkgver}/build"
    VERBOSE=1 DESTDIR=${pkgdir} make install
    install -m755 -d ${pkgdir}/etc/OpenCL/vendors
    install -m644 oclgrind.icd ${pkgdir}/etc/OpenCL/vendors
}

