# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xevd
pkgver=0.4.1
pkgrel=1
pkgdesc='MPEG-5 EVC (Essential Video Coding) decoder'
arch=('x86_64')
url='https://github.com/mpeg5/xevd/'
license=('BSD')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/mpeg5/xevd/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-xevd-disable-werror.patch'
        '020-xevd-fix-pkg-config.patch')
sha256sums=('76a72ddce00642f75f5896e11ee960293640af2e8a41f9e641e1b9310348e19a'
            '2a7eff2690c0d4d441df97ad37fd7a0e3e0a03705665dad12201f8d8d997f191'
            '28e46788d188dbbd27c0b47d2c4510029491f434cccfa41967b60d94def36d4a')

prepare() {
    printf '%s\n' "v${pkgver}" > "${pkgname}-${pkgver}/version.txt"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-xevd-disable-werror.patch"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/020-xevd-fix-pkg-config.patch"
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
