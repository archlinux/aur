# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=qs-git
pkgver=0.1.1.r1.gcdf8cc0
pkgrel=1
pkgdesc='Library for encoding and decoding quadraphonic audio in QS Regular Matrix format (git version)'
arch=('any')
url='https://github.com/quarkquad/qs/'
license=('Apache-2.0')
makedepends=(
    'catch2'
    'cmake'
    'flac'
    'git'
    'juce'
    'libvorbis')
provides=('qs')
conflicts=('qs')
source=('git+https://github.com/quarkquad/qs.git')
sha256sums=('SKIP')

pkgver() {
    git -C qs describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S qs \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DQS_TESTS:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
