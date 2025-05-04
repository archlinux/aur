# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=openapv
pkgver=0.1.13.1
pkgrel=2
pkgdesc='The reference implementation of the APV codec'
arch=('x86_64')
url='https://github.com/AcademySoftwareFoundation/openapv/'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake')
source=("https://github.com/AcademySoftwareFoundation/openapv/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-openapv-fix-pkgconfig.patch')
sha256sums=('776377c709a15473f35abddb8ae4a2d1383f471fa1ff4d3eec9c34c892ef9f2a'
            '16845b0a1d3d7fc49cb59ac5e4a42f572285208c1d581385d9828d7bbff6b447')

prepare() {
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-openapv-fix-pkgconfig.patch"
}

build() {
    CFLAGS+=' -ffat-lto-objects'
    cmake -B build -S "${pkgname}-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DOAPV_APP_STATIC_BUILD:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
