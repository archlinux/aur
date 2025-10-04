# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=torrentzip-git
pkgver=1.3.r41.g3c367a6
pkgrel=1
pkgdesc='Tool for creating identical zip archives over multiple systems (git version)'
arch=('x86_64')
url='https://github.com/0-wiz-0/trrntzip/'
license=('GPL-2.0-or-later')
depends=(
    'glibc'
    'zlib')
makedepends=(
    'cmake'
    'git'
    'python'
    'python-nihtest')
provides=('torrentzip')
conflicts=('torrentzip')
source=('git+https://github.com/0-wiz-0/trrntzip.git')
sha256sums=('SKIP')

pkgver() {
    git -C trrntzip describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S trrntzip \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    ln -s trrntzip "${pkgdir}/usr/bin/torrentzip"
}
