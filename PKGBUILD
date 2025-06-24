# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: MGislv <mgislv at ceppo dot xyz>
# Contributor: Diab Neiroukh <lazerl0rd at thezest dot dev>
# Contributor: Jacek Szafarkiewicz <szafar at linux dot pl>

pkgname=zlib-ng-git
pkgver=2.2.4.r50.gg617c852e
pkgrel=1
pkgdesc='zlib replacement with optimizations for next generation systems'
url='https://github.com/zlib-ng/zlib-ng'
arch=('x86_64')
license=('Zlib')
depends=('glibc')
makedepends=('git' 'cmake' 'ninja')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd zlib-ng
    git describe --long --tags | sed 's/-/.r/;s/-/.g/'
}

build() {
    cmake -B build -S zlib-ng \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DWITH_GTEST=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -Wno-dev

    cmake --build build
}

check() {
    ctest --output-on-failure --test-dir build
}

package() {
    provides=(zlib-ng libz-ng.so)
    conflicts=(zlib-ng)

    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 zlib-ng/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 zlib-ng/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: set ts=4 sw=4 et:
