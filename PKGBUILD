# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=rockchip-mpp
pkgver=1.0.10
pkgrel=1
epoch=1
pkgdesc='Rockchip Media Process Platform (MPP)'
arch=('x86_64')
url='https://github.com/rockchip-linux/mpp/'
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake')
source=("https://github.com/rockchip-linux/mpp/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c07e5ad49b80533856772f92b73bffc87078ad2a9446498ffdc1e38ea04488f8')

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
