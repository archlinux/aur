# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=interception-tools
pkgver=0.2.2
pkgrel=1
pkgdesc='A minimal composable infrastructure on top of libudev and libevdev'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/interception/linux/tools'
depends=('libevdev' 'yaml-cpp' 'systemd-libs')
makedepends=('cmake' 'gcc' 'systemd')
source=("$pkgname.tar.gz::https://gitlab.com/interception/linux/tools/repository/archive.tar.gz?ref=v${pkgver}"
        'udevmon.service')
sha256sums=('1f2833d3f06ea99cdae4caac91733fbf4bceb4a4f76ba725f1bda323f1c5665f'
            '92aad188c52d7b88f4951643fcfe385c19ca184b489ad3b0dcb8f0be40032f8e')

build() {
    cd ${srcdir}/tools-v${pkgver}-*
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd ${srcdir}/tools-v${pkgver}-*/build

    mkdir -p "${pkgdir}/etc/interception/udevmon.d"

    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    install -m 644 "${srcdir}/udevmon.service" "${pkgdir}/usr/lib/systemd/system"

    make DESTDIR="$pkgdir/" install
}
