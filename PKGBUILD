# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=svt-jpeg-xs
pkgver=0.9.0
pkgrel=1
pkgdesc='An implementation of the JPEG XS (ISO/IEC 21122) codec'
arch=('x86_64')
url='https://github.com/OpenVisualCloud/SVT-JPEG-XS/'
license=('BSD-2-Clause-Patent')
depends=('glibc')
makedepends=('cmake' 'yasm')
source=("https://github.com/OpenVisualCloud/SVT-JPEG-XS/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-svt-jpeg-xs-remove-werror.patch')
sha256sums=('ff5dfb3b98348a39049da4fd3062d3391cbadec4c4b61825a9f3435ca671effa'
            '27e8899b11dc3466d9b060571b51d38524e1cfc89f7552e7c8ada3d1a3035dbc')

prepare() {
    patch -d "SVT-JPEG-XS-${pkgver}" -Np1 -i "${srcdir}/010-svt-jpeg-xs-remove-werror.patch"
}

build() {
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    cmake -B build -S "SVT-JPEG-XS-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DNATIVE:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "SVT-JPEG-XS-${pkgver}/LICENSE.md" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
