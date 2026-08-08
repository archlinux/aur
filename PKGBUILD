# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xeve
pkgver=0.7.0
pkgrel=1
pkgdesc='MPEG-5 EVC (Essential Video Coding) encoder'
arch=('x86_64')
url='https://github.com/mpeg5/xeve/'
license=('BSD-3-Clause')
depends=(
    'glibc')
makedepends=(
    'cmake')
options=('!emptydirs')
source=("https://github.com/mpeg5/xeve/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-xeve-disable-werror.patch'
        '020-xeve-fix-pkg-config.patch')
sha256sums=('f60950d063f52adf11ed7196c0bbb0503fa107b0e43af06bdc81fecc24f2a62e'
            '0579f036b5f1543306c177054f749360740ac798bd2cbc20938d2717c8cd7ea2'
            '68ae77132ec2b3dd8de641d16f3d7cc0de819ddb116484809445666b4d215187')

prepare() {
    printf '%s\n' "v${pkgver}" > "${pkgname}-${pkgver}/version.txt"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-xeve-disable-werror.patch"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/020-xeve-fix-pkg-config.patch"
}

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${pkgdir}/usr/lib/xeve/libxeve.a"
}
