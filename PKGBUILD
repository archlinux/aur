# Maintainer: Imperator Storm <30777770+ImperatorStorm@users.noreply.github.com>

pkgname=minizip-git
pkgdesc="Fork of the popular zip manipulation library found in the zlib distribution."
pkgver=3.0.4.r2.gd5656f7
pkgrel=2
arch=('x86_64')
license=('zlib')
url="https://github.com/zlib-ng/minizip-ng"
depends=('zstd' 'zlib' 'bzip2' 'openssl')
makedepends=('git' 'cmake')
conflicts=('minizip' 'minizip-ng' 'minizip-asm' 'lib32-minizip')
provides=('minizip' 'minizip-ng' 'libminizip.so=3')
optdepends=('xz: enables xz and lzma compression' 'libbsd: Build with libbsd for crypto random')
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

