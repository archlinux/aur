# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xeve-git
pkgver=0.4.3.r5.gcebfd5c
pkgrel=2
pkgdesc='MPEG-5 EVC (Essential Video Coding) encoder (git version)'
arch=('x86_64')
url='https://github.com/mpeg5/xeve/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('xeve')
conflicts=('xeve')
source=('git+https://github.com/mpeg5/xeve.git'
        '010-xeve-disable-werror.patch'
        '020-xeve-fix-pkg-config.patch')
sha256sums=('SKIP'
            '8c4b607f34a5d39e824f86d00ab101849595cb49a2f67eed131487d658ec7206'
            '68ae77132ec2b3dd8de641d16f3d7cc0de819ddb116484809445666b4d215187')

prepare() {
    patch -d xeve -Np1 -i "${srcdir}/010-xeve-disable-werror.patch"
    patch -d xeve -Np1 -i "${srcdir}/020-xeve-fix-pkg-config.patch"
}

pkgver() {
    git -C xeve describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CFLAGS+=' -mno-xsave -ffat-lto-objects'
    cmake -B build -S xeve \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 xeve/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
