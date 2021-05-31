# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-media-driver-git
pkgver=2021.2.1.r53.g67261a4df
pkgrel=1
pkgdesc='Intel Media Driver for VAAPI — Broadwell+ iGPUs (git version)'
arch=('x86_64')
url='https://github.com/intel/media-driver/'
license=('MIT' 'BSD')
depends=(
    # official repositories:
        'gcc-libs' 'libpciaccess'
    # AUR:
        'intel-gmmlib-git' 'libva-git'
)
makedepends=('git' 'cmake')
provides=('intel-media-driver')
conflicts=('intel-media-driver')
source=('git+https://github.com/intel/media-driver.git')
sha256sums=('SKIP')

pkgver() {
    git -C media-driver describe --long --tags | sed 's/^intel-media-//;s/^[0-9]\{2\}/20&/;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S media-driver \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DINSTALL_DRIVER_SYSCONF:BOOL='OFF' \
        -DMEDIA_BUILD_FATAL_WARNINGS='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 media-driver/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
