# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=libratbag
pkgver=0.9.901
pkgrel=1
pkgdesc='A library to configure gaming mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/libratbag'
license=('MIT')
depends=('glibc' 'libevdev' 'libudev.so' 'python')
makedepends=('systemd' 'meson' 'git' 'swig')
source=("https://github.com/libratbag/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fe432cdcc8ce6e6b33d1dea4b8d94997cb8e89b1eaab52e723fcc60c35e5d17b')
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
