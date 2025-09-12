# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=rockchip-mpp
pkgver=1.0.11
pkgrel=1
epoch=1
pkgdesc='Rockchip Media Process Platform (MPP)'
arch=('x86_64')
url='https://github.com/rockchip-linux/mpp/'
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
source=("https://github.com/rockchip-linux/mpp/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e97f67e0d2e028ef444099443b6e77efea9f7db83edcbf080f539a44c1c2d36c')

build() {
    # fix build with gcc 15
    export CFLAGS+=' -Wno-error=incompatible-pointer-types'
    
    cmake -B build -S "mpp-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_VPROC_VDPP:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "mpp-${pkgver}/LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
