# Maintainer: Lucy Faria <me@lucyfaria.net>
# Based on Arch "fmt" package and AUR "fmt10" package

pkgname=fmt11
pkgver=11.2.0
pkgrel=1
pkgdesc='Open-source formatting library for C++ (major version 11)'
arch=(x86_64)
url=https://fmt.dev/11.2/
license=(MIT)
depends=(
    gcc-libs
)
makedepends=(
    git
    ninja
    cmake
)
provides=(
    libfmt.so
    libfmt.so.11
)
_commit_sha=40626af88bd7df9a5fb80be7b25ac85b122d6c21
source=(
    git+https://github.com/fmtlib/fmt.git#commit=${_commit_sha}
)
sha256sums=(
    'b93b8fa1777c5876c5a35867be2ede804240f8627e7e69e147b1718f4063a235'
)

build() {
    cmake -S fmt -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DFMT_CMAKE_DIR=lib/cmake/$pkgname \
        -DFMT_INC_DIR=include/$pkgname \
        -DFMT_PKGCONFIG_DIR=lib/$pkgname/pkgconfig \
        -DFMT_TEST="$CHECKFUNC" \
        -DBUILD_SHARED_LIBS=ON \
        -Wno-dev
    
    cmake --build build

}
package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm 644 fmt/LICENSE -t "${pkgdir}"/usr/share/licenses/fmt11/

    cd "$pkgdir"
    ln -sf ../libfmt.so.11 usr/lib/$pkgname/libfmt.so
    rm usr/lib/libfmt.so
    sed -i "/libdir/s/\/lib/&\/$pkgname/" usr/lib/$pkgname/pkgconfig/*.pc
}
check() {
    cmake --build build --target test
}