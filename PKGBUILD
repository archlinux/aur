# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=libratbag
pkgver=0.9.902
pkgrel=1
pkgdesc='A library to configure gaming mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=('glibc' 'libevdev' 'libudev.so' 'python' 'python-evdev')
makedepends=('systemd' 'meson' 'git' 'swig')
source=("https://github.com/libratbag/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('01c0dac6b8cd997c3bec84a51c0a86fc8727e3a20635bf7e2c5e0f0b8c5df34c')
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
