# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=dsdcc-git
pkgver=r54.8624eeb
pkgrel=1
pkgdesc="Digital Speech Decoder (DSD) rewritten as a C++ library"
arch=('i686' 'x86_64')
url="https://github.com/f4exb/dsdcc"
license=('GPL3')
depends=('mbelib' 'serialdv-git')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/f4exb/dsdcc.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i 's|LIBSERIAL_NAMES|LIBSERIALDV_NAMES|g' cmake/Modules/FindSerialDV.cmake
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIBSERIALDV_INCLUDE_DIR=/usr/include/serialdv \
        -DUSE_MBELIB=ON
    make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
