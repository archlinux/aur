# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libmysofa-git
pkgver=1.0.r15.gbaaa972
pkgrel=1
pkgdesc='C library to read HRTFs if they are stored in the AES69-2015 SOFA format (git version)'
arch=('x86_64')
url='https://github.com/hoene/libmysofa/'
license=('BSD')
depends=('zlib')
makedepends=('git' 'cmake' 'cunit')
checkdepends=('nodejs')
provides=('libmysofa')
conflicts=('libmysofa')
source=('git+https://github.com/hoene/libmysofa.git')
sha256sums=('SKIP')

pkgver() {
    cd libmysofa
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B libmysofa/build -S libmysofa \
        -DBUILD_TESTS:BOOL='ON' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCODE_COVERAGE:BOOL='OFF' \
        -Wno-dev
    make -C libmysofa/build all
}

check() {
    make -C libmysofa/build test
}

package() {
    make -C libmysofa/build DESTDIR="$pkgdir" install
    install -D -m644 libmysofa/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
