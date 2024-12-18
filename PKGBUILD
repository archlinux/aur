# Maintainer: taotieren <admin@taotieren.com>

pkgbase=libosal
pkgname=libosal
pkgver=0.0.5
pkgrel=2
pkgdesc="libosal is an operating system abstraction layer Library. It's purpose is to write os-independent code for easy portability between different systems and architectures."
arch=($CARCH)
url="https://github.com/robert-burger/libosal"
license=('LGPL-3.0-only')
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(glibc)
makedepends=(
    cmake
    pkgconf)
checkdepends=()
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('74528bcac168feb45feffe3178887ee566d38d1a04a58b73f4806b2fdd56e6e3')
options=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    #     autoreconf -is
    #     ./configure --prefix=/usr
    #     make

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    # gcc build
    #     cmake -DCMAKE_BUILD_TYPE=Release \
    cmake -DCMAKE_BUILD_TYPE=None \
        -DBUILD_FOR_PLATFORM="POSIX" \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -Wno-dev

    cmake --build build
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    #     make check
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}"/${pkgname}-${pkgver}/build
    #     cd "${srcdir}/${pkgname}-${pkgver}"
    #     make DESTDIR=${pkgdir} install
}
