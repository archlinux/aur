# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=svt-jpeg-xs
pkgver=0.10.0
pkgrel=1
pkgdesc='An implementation of the JPEG XS (ISO/IEC 21122) codec'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-JPEG-XS/'
license=('BSD-2-Clause-Patent')
depends=(
    'glibc')
makedepends=(
    'cmake'
    'yasm')
source=("https://github.com/OpenVisualCloud/SVT-JPEG-XS/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-svt-jpeg-xs-remove-werror.patch')
sha256sums=('ae04de9afe2c086a15da85ff7473ec1db127c380081c11c8860f958e8454f0ff'
            'cd095dfd29cc2bdc5ca5e0bb21decad57793c1f17ac4dc5739473c1a4eb8b05c')

prepare() {
    patch -d "SVT-JPEG-XS-${pkgver}" -Np1 -i "${srcdir}/010-svt-jpeg-xs-remove-werror.patch"
}

build() {
    cmake -B build -S "SVT-JPEG-XS-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DNATIVE:BOOL='OFF' \
        -Wno-author
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "SVT-JPEG-XS-${pkgver}/LICENSE.md" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
