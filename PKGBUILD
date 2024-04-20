# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xeve-git
pkgver=0.5.0.r0.g9d5e87e
pkgrel=1
pkgdesc='MPEG-5 EVC (Essential Video Coding) encoder (git version)'
arch=('x86_64')
url='https://github.com/mpeg5/xeve/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('xeve')
conflicts=('xeve')
options=('!emptydirs')
source=('git+https://github.com/mpeg5/xeve.git'
        '010-xeve-disable-werror.patch'
        '020-xeve-fix-pkg-config.patch'
        '030-xeve-app-dynyamic-linking.patch')
sha256sums=('SKIP'
            '8c4b607f34a5d39e824f86d00ab101849595cb49a2f67eed131487d658ec7206'
            '68ae77132ec2b3dd8de641d16f3d7cc0de819ddb116484809445666b4d215187'
            '93206033fdea10662d91145ae2883d801fc5a4228db456ad935fedea2488222a')

prepare() {
    patch -d xeve -Np1 -i "${srcdir}/010-xeve-disable-werror.patch"
    patch -d xeve -Np1 -i "${srcdir}/020-xeve-fix-pkg-config.patch"
    patch -d xeve -Np1 -i "${srcdir}/030-xeve-app-dynyamic-linking.patch"
}

pkgver() {
    git -C xeve describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
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
    rm "${pkgdir}/usr/lib/xeve/libxeve.a"
}
