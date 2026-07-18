# Maintainer: Abhiram Shibu <abhiramshibu1998@gmail.com>

_pkgname=aocl-dlp
pkgname="${_pkgname}-git"
pkgver=20260701.r0.gcf71aa7
pkgrel=1
pkgdesc="Development snapshot of AMD Optimizing CPU Libraries - Deep Learning Primitives"
arch=('x86_64')
url="https://github.com/amd/aocl-dlp"
license=('BSD-3-Clause')
options=('staticlibs')
depends=('gcc-libs')
makedepends=('cmake' 'ninja' 'gcc' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^AOCL-//;s/-/.r/;s/-/./g'
}

build() {
    cmake -S "${_pkgname}" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDLP_THREADING_MODEL=openmp \
        -DBUILD_BENCHMARKS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_TESTING=OFF \
        -G Ninja
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
