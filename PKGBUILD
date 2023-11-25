# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xevd-git
pkgver=0.4.1.r6.g418ed6d
pkgrel=1
pkgdesc='MPEG-5 EVC (Essential Video Coding) decoder (git version)'
arch=('x86_64')
url='https://github.com/mpeg5/xevd/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake')
provides=('xevd')
conflicts=('xevd')
source=('git+https://github.com/mpeg5/xevd.git'
        '010-xevd-disable-werror.patch'
        '020-xevd-fix-pkg-config.patch')
sha256sums=('SKIP'
            '2a7eff2690c0d4d441df97ad37fd7a0e3e0a03705665dad12201f8d8d997f191'
            '28e46788d188dbbd27c0b47d2c4510029491f434cccfa41967b60d94def36d4a')

prepare() {
    patch -d xevd -Np1 -i "${srcdir}/010-xevd-disable-werror.patch"
    patch -d xevd -Np1 -i "${srcdir}/020-xevd-fix-pkg-config.patch"
}

pkgver() {
    git -C xevd describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    cmake -B build -S xevd \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 xevd/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
