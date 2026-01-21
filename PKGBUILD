# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: dummyx <dummyxa at gmail dot com>

pkgname=vvenc
pkgver=1.14.0
pkgrel=1
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
sha256sums=('dd43d061d59dbc0d9b9ae5b99cb40672877dd811646228938f065798939ee174')

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
