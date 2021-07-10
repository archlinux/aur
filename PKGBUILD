# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=igsc-git
pkgver=0.2.2.r12.g90bfd55
pkgrel=1
pkgdesc='Intel Graphics System Controller Firmware Update (git version)'
arch=('x86_64')
url='https://github.com/intel/igsc/'
license=('Apache')
depends=('systemd-libs')
makedepends=('git' 'cmake' 'systemd')
source=('git+https://github.com/intel/igsc.git'
        'git+https://github.com/intel/metee.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    git -C igsc describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^V//'
}

build() {
    export LIBMETEE_REPO="${srcdir}/metee"
    cmake -B build -S igsc \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_WERROR:BOOL='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
