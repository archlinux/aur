# Maintainer: Francisco Lopes <francisco@oblita.com>
pkgname=interception-tools
pkgver=0.2.0
pkgrel=2
pkgdesc='A minimal composable infrastructure on top of libudev and libevdev'
arch=('x86_64')
license=('GPL3')
url='https://gitlab.com/interception/linux/tools'
depends=('libevdev' 'yaml-cpp')
makedepends=('cmake' 'gcc')
source=("$pkgname.tar.gz::https://gitlab.com/interception/linux/tools/repository/archive.tar.gz?ref=v${pkgver}"
        'udevmon.service')
sha256sums=('66f61f1ee1384572447d304059224e7126ea76a491e83c0dad3a73bb723eca17'
            'c816ef7d93171d818180aa18ac650de54156856da564b2ed889093df55ff69bc')

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
