# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=rockchip-mpp
pkgver=1.1.0
pkgrel=1
epoch=1
pkgdesc='Rockchip Media Process Platform (MPP)'
arch=('x86_64')
url='https://github.com/rockchip-linux/mpp/'
license=('Apache-2.0' 'MIT')
depends=(
    'glibc'
    'libstdc++')
makedepends=(
    'cmake')
source=("https://github.com/rockchip-linux/mpp/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-rockchip-mpp-silence-unwanted-log-messages.patch')
sha256sums=('7bb0040f364468ad9abbb71a04553ebc6a5814584e083c2fc9a553783e9656df'
            'bdec0c21ffdeadf128d670a304be59eccb253e45ff78a1ee70a0f4b305ff05e0')

prepare() {
    # silence unwanted log messages described in https://github.com/rockchip-linux/mpp/issues/820
    patch -d "mpp-${pkgver}" -Np1 -i "${srcdir}/010-rockchip-mpp-silence-unwanted-log-messages.patch"
}

build() {
    cmake -B build -S "mpp-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DENABLE_VPROC_VDPP:BOOL='ON' \
        -Wno-author
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "mpp-${pkgver}/LICENSES/MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
