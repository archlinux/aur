# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=openapv-git
pkgver=0.1.13.1.r43.g867ed70
pkgrel=1
pkgdesc='The reference implementation of the APV codec (git version)'
arch=('x86_64')
url='https://github.com/AcademySoftwareFoundation/openapv/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake' 'git')
provides=('openapv')
conflicts=('openapv')
source=('git+https://github.com/AcademySoftwareFoundation/openapv.git')
sha256sums=('SKIP')

pkgver() {
    git -C openapv describe --long --tags --abbrev='7' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    CFLAGS+=' -ffat-lto-objects'
    cmake -B build -S openapv \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DOAPV_APP_STATIC_BUILD:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 openapv/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
