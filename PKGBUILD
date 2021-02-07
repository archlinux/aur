# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=cs-signal-git
pkgver=r45.6add822
pkgrel=1
pkgdesc='Library for thread aware signal/slot delivery (git version)'
arch=('x86_64')
url='https://www.copperspice.com/'
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=('cs-signal')
conflicts=('cs-signal')
source=('git+https://github.com/copperspice/cs_signal.git')
sha256sums=('SKIP')

pkgver() {
    printf 'r%s.%s' "$(git -C cs_signal rev-list --count HEAD)" "$(git -C cs_signal rev-parse --short HEAD)"
}

build() {
    cmake -B build -S cs_signal \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C build
}

check() {
    build/bin/Test
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 cs_signal/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
