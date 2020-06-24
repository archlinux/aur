# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Devaux Fabien <fdev31@gmail.com>

pkgname=srt-git
pkgver=1.4.1.r254.g3e87ca1c
pkgrel=1
pkgdesc='Secure Reliable Transport - transport technology that optimizes streaming performance across unpredictable networks (git version)'
arch=('x86_64')
url='https://www.srtalliance.org/'
license=('MPL2')
depends=('openssl')
makedepends=('git' 'cmake')
provides=('srt')
conflicts=('srt')
source=('git+https://github.com/Haivision/srt.git')
sha256sums=('SKIP')

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
