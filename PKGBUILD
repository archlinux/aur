# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-media-driver-git
pkgver=2025.1.4.r15.g2ceb91c50
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI — Broadwell+ iGPUs (git version)'
arch=('x86_64')
url='https://github.com/intel/media-driver/'
license=('MIT' 'BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'intel-gmmlib-git' 'libva-git')
makedepends=('cmake' 'git')
provides=('intel-media-driver')
conflicts=('intel-media-driver')
source=('git+https://github.com/intel/media-driver.git'
        '010-intel-media-driver-cmake4-fix.patch')
sha256sums=('SKIP'
            '8a00706601412986b8806e7b815f773b30762da218784223a4019962200e81be')

prepare() {
    patch -d media-driver -Np1 -i "${srcdir}/010-intel-media-driver-cmake4-fix.patch"
}

pkgver() {
    git -C media-driver describe --long --tags | sed 's/^intel-media-//;s/^[0-9]\{2\}/20&/;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S media-driver \
        -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DINSTALL_DRIVER_SYSCONF:BOOL='OFF' \
        -DMEDIA_BUILD_FATAL_WARNINGS='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 media-driver/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
