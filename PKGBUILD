# Maintainer: Imperator Storm <ImperatorStorm11@protonmail.com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgbase=minizip-git
pkgname=minizip-git
pkgdesc="Fork of the popular zip manipulation library found in the zlib distribution."
pkgver=4.0.10.r27.gf890d80
pkgrel=2
arch=('x86_64' 'aarch64' 'i686')
license=('Zlib')
url="https://github.com/zlib-ng/minizip-ng"
depends=('zstd' 'bzip2' 'openssl>=3.0.7' 'libbsd')
makedepends=('git' 'cmake')
source=("${pkgname}::git+https://github.com/zlib-ng/minizip-ng#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgbase}
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${srcdir}/${pkgbase}
    if [[ -d build ]]; then
      rm -rf build
    fi
    if [[ -d build-static ]]; then
      rm -rf build-static
    fi
    mkdir build
    mkdir build-static
    if [[ -d build-ng ]]; then
      rm -rf build-ng
    fi
    if [[ -d build-ng-static ]]; then
      rm -rf build-ng-static
    fi
    mkdir build-ng
    mkdir build-ng-static
}

build() {
    cd ${srcdir}/${pkgbase}/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DMZ_COMPAT=ON \
        -DCMAKE_INSTALL_INCLUDEDIR=/usr/include/minizip \
        -DCMAKE_BUILD_TYPE=None \
        ..
    make
    cd ../build-ng
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DMZ_PROJECT_SUFFIX="-ng" \
        -DBUILD_SHARED_LIBS=ON \
        ..
    make
}

package_minizip-git() {
    conflicts=('minizip' 'minizip-ng')
    provides=('minizip' 'minizip-ng' 'libminizip.so=4')
    cd ${srcdir}/${pkgbase}/build
    make DESTDIR="${pkgdir}" install
    cd ${srcdir}/${pkgbase}/build-ng
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/usr/include/"{,un}"zip.h" # conflict with libzip
}
