# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xeve
pkgver=0.7.1
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
sha256sums=('5d1249212f431816b4723937c9ec8491b45ee1bb75c0f46692deaf7f59fbf19c'
            '0579f036b5f1543306c177054f749360740ac798bd2cbc20938d2717c8cd7ea2'
            'aae6de85f948df7d6b3dc0cf5ce477c4a8e2cfd463d3a9abbdd8e85351e17722')

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
