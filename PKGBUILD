# Maintainer: Imperator Storm <30777770+ImperatorStorm@users.noreply.github.com>

pkgname=minizip-git
pkgdesc="Fork of the popular zip manipulation library found in the zlib distribution."
pkgver=3.0.3.r0.g99d3901
pkgrel=2
arch=('x86_64')
license=('zlib')
url="https://github.com/zlib-ng/minizip-ng"
depends=('glibc' 'zlib')
makedepends=('git' 'cmake')
conflicts=('minizip' 'minizip-ng' 'minizip-asm' 'lib32-minizip')
provides=('minizip' 'minizip-ng' 'libminizip.so=3')
optdepends=('zstd: enables zstd compression' 'xz: enables xz and lzma compression' 'bzip2: enables bzip2 compression' 'openssl: enables encryption via openssl' 'libbsd: Build with libbsd for crypto random')
source=("${pkgname}::git+https://github.com/zlib-ng/minizip-ng#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${srcdir}/${pkgname}
    if [[ -d build ]]; then
      rm -rf build
    fi
    mkdir build
}

build() {
    cd ${srcdir}/${pkgname}/build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_INCLUDEDIR=/usr/include/minizip \
        -DCMAKE_BUILD_TYPE=None \
        ..
    make
}

package() {
    cd ${srcdir}/${pkgname}/build
    make DESTDIR="${pkgdir}" install
    install -D -m644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/minizip/LICENSE"
}

