# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-media-driver-git
pkgver=2025.1.4.r25.g187a0c7d0
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI — Broadwell+ iGPUs (git version)'
arch=('x86_64')
url='https://github.com/intel/media-driver/'
license=('MIT' 'BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'intel-gmmlib-git' 'libva-git')
makedepends=('cmake' 'git')
provides=('intel-media-driver')
conflicts=('intel-media-driver')
source=('git+https://github.com/intel/media-driver.git')
sha256sums=('SKIP')

pkgver() {
    git -C media-driver describe --long --tags | sed 's/^intel-media-//;s/^[0-9]\{2\}/20&/;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S media-driver \
        -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING="3.5.0" \
        -DINSTALL_DRIVER_SYSCONF:BOOL='OFF' \
        -DMEDIA_BUILD_FATAL_WARNINGS='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 media-driver/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
