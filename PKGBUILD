# Maintainer: taotieren <admin@taotieren.com>

pkgname=c6
pkgver=0.6.3
pkgrel=1
pkgdesc="A c6 compiler that is self-booting, independent of TCC, and supports multiple backends (native x86-64 / C99 / LLVM IR)"
arch=($CARCH)
url="https://github.com/c6lang/c6"
license=('LGPL-2.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    'glibc'
)
makedepends=(
    'cmake'
    'git'
)
checkdepends=(
    'go'
    'python'
    'rust'
)
options=('docs' 'staticlibs' '!lto')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('bdf8835494a853f4b73c54e60df581532d1cbcf33bcacfcffa458a4829559ea0')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    cmake -S . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DC6_TCC_SHARED_LIBTCC=ON \
        -B build 
    cmake --build build --parallel
}

check() {
    cd "${srcdir}/${pkgname}"
    ctest --test-dir build --output-on-failure
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" cmake --install build
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
