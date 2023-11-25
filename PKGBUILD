# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xeve
pkgver=0.4.3
pkgrel=1
pkgdesc='MPEG-5 EVC (Essential Video Coding) encoder'
arch=('x86_64')
url='https://github.com/mpeg5/xeve/'
license=('BSD')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/mpeg5/xeve/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-xeve-disable-werror.patch'
        '020-xeve-fix-pkg-config.patch')
sha256sums=('2c8ac465618fb66d0d13df6efcf6ca0d55c2ac1695dd0e9092aeb366a74b9179'
            '8c4b607f34a5d39e824f86d00ab101849595cb49a2f67eed131487d658ec7206'
            '68ae77132ec2b3dd8de641d16f3d7cc0de819ddb116484809445666b4d215187')

prepare() {
    printf '%s\n' "v${pkgver}" > "${pkgname}-${pkgver}/version.txt"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-xeve-disable-werror.patch"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/020-xeve-fix-pkg-config.patch"
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
