# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Andreas Hauser <andy-aur@splashground.de>
# Contributor: Beej Jorgensen <beej@beej.us>
# Maintainer : Thomas Laroche <tho.laroche@gmail.com>

pkgname=fann-git
pkgver=2.2.0.r189.g3907e1b
pkgrel=2
pkgdesc='Fast Artificial Neural Network Library (git version)'
url='https://leenissen.dk/fann/'
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=(
    'gcc-libs'
    'glibc')
makedepends=(
    'cmake'
    'git')
provides=('fann')
conflicts=('fann')
source=('git+https://github.com/libfann/fann.git')
sha256sums=('SKIP')

pkgver() {
    git -C fann describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S fann \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    cd build/tests
    ./fann_tests
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    rm -r "${pkgdir}/usr/include"/{gmock,gtest}
    rm -r "${pkgdir}/usr/lib/cmake/GTest"
    rm "${pkgdir}/usr/lib/pkgconfig"/{gmock*,gtest*}
    rm "${pkgdir}/usr/lib"/lib{gmock*,gtest*}
}
