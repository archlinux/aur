# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xevd
pkgver=0.4.1
pkgrel=2
pkgdesc='MPEG-5 EVC (Essential Video Coding) decoder'
arch=('x86_64')
url='https://github.com/mpeg5/xevd/'
license=('BSD')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/mpeg5/xevd/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-xevd-disable-werror.patch'
        '020-xevd-fix-pkg-config.patch'
        '030-xevd-fix-segfault.patch'::'https://github.com/mpeg5/xevd/commit/418ed6dfb5d09b9c730f0d474364436d994f4006.patch')
sha256sums=('76a72ddce00642f75f5896e11ee960293640af2e8a41f9e641e1b9310348e19a'
            '2a7eff2690c0d4d441df97ad37fd7a0e3e0a03705665dad12201f8d8d997f191'
            '28e46788d188dbbd27c0b47d2c4510029491f434cccfa41967b60d94def36d4a'
            'dc0b470b4829638ef803d093bbe613a8ae770fb4b90ae5f9dfebb5b2cc613189')

prepare() {
    printf '%s\n' "v${pkgver}" > "${pkgname}-${pkgver}/version.txt"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-xevd-disable-werror.patch"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/020-xevd-fix-pkg-config.patch"
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/030-xevd-fix-segfault.patch"
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
