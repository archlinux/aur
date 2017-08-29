# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=libratbag
pkgver=0.9.900
pkgrel=4
pkgdesc='A library to configure gaming mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=('glibc' 'libevdev' 'libudev.so')
makedepends=('chrpath' 'systemd' 'meson')
source=("https://github.com/libratbag/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('95277e97afcaa393e05b80797681384842af6f803b8e51d49de6669498779c95')
conflicts=('libratbag-git' 'ratbagd<=0.4')

build() {
    cd ${pkgname}-${pkgver}

    meson builddir --prefix=/usr/ -Denable-tests=false
    ninja -C builddir
}

package() {
    cd ${pkgname}-${pkgver}

    DESTDIR="${pkgdir}" ninja -C builddir install

    install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
    install -m 644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/

    msg "Don't forget to enable and start the ratbagd service to use piper"
    msg2 "# systemctl enable ratbagd.service"
    msg2 "# systemctl start ratbagd.service"
}
