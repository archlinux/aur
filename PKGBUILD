# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: dummyx <dummyxa at gmail dot com>

pkgname=vvenc
pkgver=1.13.1
pkgrel=2
pkgdesc='A H.266/VVC (Versatile Video Coding) encoder'
arch=('x86_64')
url='https://github.com/fraunhoferhhi/vvenc/'
license=('BSD-3-Clause-Clear')
depends=(
    'gcc-libs'
    'glibc')
makedepends=(
    'cmake')
source=("https://github.com/fraunhoferhhi/vvenc/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9d0d88319b9c200ebf428471a3f042ea7dcd868e8be096c66e19120a671a0bc8')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -DVVENC_INSTALL_FULLFEATURE_APP:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    export LD_LIBRARY_PATH="${srcdir}/${pkgname}-${pkgver}/lib/release-shared"
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
