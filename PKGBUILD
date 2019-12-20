# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Devaux Fabien <fdev31@gmail.com>

pkgname=srt-git
pkgver=1.4.1.r16.g8519cb68
pkgrel=1
pkgdesc='Secure Reliable Transport - transport technology that optimizes streaming performance across unpredictable networks (git version)'
arch=('x86_64')
url='https://www.srtalliance.org/'
license=('MPL2')
depends=('openssl')
makedepends=('git' 'cmake')
provides=('srt')
conflicts=('srt')
source=('git+https://github.com/Haivision/srt.git'
        '010-srt-git-remove-insecure-rpath.patch')
sha256sums=('SKIP'
            'dbe07877e49f5894f70c195b67177645e39a6a0cda3f2ba356cc82240e4f91a9')

prepare() {
    patch -d srt -Np1 -i "${srcdir}/010-srt-git-remove-insecure-rpath.patch"
}

pkgver() {
    cd srt
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S srt \
        -DCMAKE_INSTALL_BINDIR:PATH='bin' \
        -DCMAKE_INSTALL_INCLUDEDIR:PATH='include' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_TESTING='True' \
        -Wno-dev
    make -C build
}

check() {
    build/uriparser-test
    build/utility-test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/bin/*-test{,-*}
}
