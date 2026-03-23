# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=oclgrind
pkgver=26.03.1
pkgrel=1
pkgdesc='OpenCL device simulator and debugger'
arch=('x86_64')
url='https://github.com/jrprice/Oclgrind'
license=('BSD-3-Clause')
depends=('clang' 'llvm-libs' 'gcc-libs' 'readline')
makedepends=('cmake' 'llvm')
optdepends=('ocl-icd: OpenCL ICD loader support')
conflicts=('oclgrind-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jrprice/Oclgrind/archive/v${pkgver}.tar.gz")
sha256sums=('d21a705a2b71491b1505f34a50e14f9666516d1654c0e6745983408bb300e4c2')

build() {
    cmake -B build -S "Oclgrind-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIBDIR_SUFFIX=""
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 "Oclgrind-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 build/oclgrind.icd \
        "${pkgdir}/etc/OpenCL/vendors/oclgrind.icd"
}

latestver() {
    curl -s https://api.github.com/repos/jrprice/Oclgrind/releases/latest \
        | sed -n 's/.*"tag_name": "v\(.*\)".*/\1/p'
}
