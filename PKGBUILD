# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-media-driver-legacy
pkgver=24.3.4
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI (legacy platforms)'
arch=('x86_64')
url='https://github.com/intel/media-driver/'
license=('BSD-3-Clause' 'MIT')
depends=(
    'gcc-libs'
    'glibc'
    'intel-gmmlib-legacy'
    'libva')
makedepends=('cmake')
provides=("intel-media-driver=${pkgver}")
conflicts=('intel-media-driver')
source=("https://github.com/intel/media-driver/archive/intel-media-${pkgver}/${pkgname%-*}-${pkgver}.tar.gz"
        '010-intel-media-driver-gcc15-fix.patch'::'https://github.com/intel/media-driver/commit/46a7058714b17a13cf62c052ab1134031fa5f706.patch')
sha256sums=('58978f9ee4981532e60be2f2768673b1f3825db09971ebb98fbd7e8819cab6eb'
            'a8a77691462a1d171edbf8247469969b82c1e49dab4c118cf0e87cb5a89f2ed4')

prepare() {
    patch -d "media-driver-intel-media-${pkgver}" -Np1 -i "${srcdir}/010-intel-media-driver-gcc15-fix.patch"
}

build() {
    cmake -B build -S "media-driver-intel-media-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DINSTALL_DRIVER_SYSCONF:BOOL='OFF' \
        -DMEDIA_BUILD_FATAL_WARNINGS:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "media-driver-intel-media-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
