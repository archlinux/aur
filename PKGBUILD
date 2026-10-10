# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xevd
pkgver=0.8.0
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
sha256sums=('258d626fbb6c7ea1677b4fb0ffed3eaca2ec312810d6a76f67359fdc16068472'
            'a7a22d26772657046475b1e664cbab3331355aef847f51bbb74d0bede25462f2'
            '13dca2086607c63bca3785e832ff17adb494f654c295a24d57a1a3e951bdc6dd')

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
