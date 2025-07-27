# Maintainer: AshLink <ashraf.zoubeh.123@gmail.com>

pkgname=farrayinterop-git
pkgver=0.r0.ga5f0a51 
pkgrel=1
pkgdesc='A library that allows the use of Fortran arrays in C++'
arch=('x86_64')
url='https://github.com/AshLink95/FarrayInterop'
license=('MIT')

depends=('gcc' 'gcc-libs' 'gcc-fortran')
makedepends=('cmake' 'git' 'ninja')
checkdepends=('gtest')

source=("${pkgname}::git+https://github.com/AshLink95/FarrayInterop.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    if git describe --tags --long &>/dev/null; then
        git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
    else
        echo "0.r0.g$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "${srcdir}/${pkgname}"
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -G Ninja -S . -B build
    cmake --build build -j 4
}

check() {
    cd "${srcdir}/${pkgname}/build"
    ctest
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install headers
    install -Dm644 libdir/farray.hpp "$pkgdir/usr/include/farray.hpp"
    install -Dm644 libdir/farray1D.tpp "$pkgdir/usr/include/farray1D.tpp"

    # Install static library
    install -Dm644 libdir/libfarray.a "$pkgdir/usr/lib/libfarray.a"
}
