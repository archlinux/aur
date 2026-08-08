# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xeve-git
pkgver=0.7.0.r0.g4325639
pkgrel=1
pkgdesc='MPEG-5 EVC (Essential Video Coding) encoder (git version)'
arch=('x86_64')
url='https://github.com/mpeg5/xeve/'
license=('BSD-3-Clause')
depends=(
    'glibc')
makedepends=(
    'cmake'
    'git')
provides=('xeve')
conflicts=('xeve')
options=('!emptydirs')
source=('git+https://github.com/mpeg5/xeve.git'
        '010-xeve-disable-werror.patch'
        '020-xeve-fix-pkg-config.patch')
sha256sums=('SKIP'
            '0579f036b5f1543306c177054f749360740ac798bd2cbc20938d2717c8cd7ea2'
            '68ae77132ec2b3dd8de641d16f3d7cc0de819ddb116484809445666b4d215187')

prepare() {
    patch -d xeve -Np1 -i "${srcdir}/010-xeve-disable-werror.patch"
    patch -d xeve -Np1 -i "${srcdir}/020-xeve-fix-pkg-config.patch"
}

pkgver() {
    git -C xeve describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S xeve \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 xeve/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${pkgdir}/usr/lib/xeve/libxeve.a"
}
