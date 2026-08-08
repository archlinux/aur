# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xevd
pkgver=0.7.0
pkgrel=1
pkgdesc='MPEG-5 EVC (Essential Video Coding) decoder'
arch=('x86_64')
url='https://github.com/mpeg5/xevd/'
license=('BSD-3-Clause')
depends=(
    'glibc')
makedepends=(
    'cmake')
options=('!emptydirs')
source=("https://github.com/mpeg5/xevd/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-xevd-disable-werror.patch'
        '020-xevd-fix-pkg-config.patch')
sha256sums=('febfdb532819bbf36b1b04e74d3ef328ad0f0f2db6224ddb7640fce6bd0014f4'
            'a7a22d26772657046475b1e664cbab3331355aef847f51bbb74d0bede25462f2'
            '28e46788d188dbbd27c0b47d2c4510029491f434cccfa41967b60d94def36d4a')

prepare() {
    printf '%s\n' "v${pkgver}" > "${pkgname}-${pkgver}/version.txt"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-xevd-disable-werror.patch"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/020-xevd-fix-pkg-config.patch"
}

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DXEVD_APP_STATIC_BUILD:BOOL='OFF' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm "${pkgdir}/usr/lib/xevd/libxevd.a"
}
