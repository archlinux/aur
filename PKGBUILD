# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=rockchip-mpp
pkgver=1.0.11
pkgrel=3
epoch=1
pkgdesc='Rockchip Media Process Platform (MPP)'
arch=('x86_64')
# https://github.com/HermanChen/mpp/issues/71
# https://github.com/HermanChen/mpp/issues/73
#url='https://github.com/rockchip-linux/mpp/'
url='https://github.com/HermanChen/mpp/'
license=('Apache-2.0' 'MIT')
depends=(
    'glibc'
    'libstdc++')
makedepends=(
    'cmake')
source=("https://github.com/HermanChen/mpp/archive/${pkgver}/${pkgname}-HermanChen-${pkgver}.tar.gz"
        '010-rockchip-mpp-silence-unwanted-log-messages.patch')
sha256sums=('e97f67e0d2e028ef444099443b6e77efea9f7db83edcbf080f539a44c1c2d36c'
            '9764a01c08f5c1883e675295f8ebc8c26604a7b48d1f9c7df4c9d8c95f32dc26')

prepare() {
    patch -d "mpp-${pkgver}" -Np1 -i "${srcdir}/010-rockchip-mpp-silence-unwanted-log-messages.patch"
}

build() {
    # fix build with gcc 15+
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
