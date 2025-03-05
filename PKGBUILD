# Maintainer: Strykar <strykar@hotmail.com>

_pkgname=vallumd
pkgname=vallumd-git
pkgver=r152.e76a8e1
pkgrel=1
pkgdesc="Centralize and distribute Fail2ban IP blacklists over MQTT"
arch=('x86_64')
url="https://codeberg.org/stintel/vallumd"
license=('GPL-3.0-only')
depends=('ipset' 'openssl' 'mosquitto')
makedepends=('cmake' 'git')
provides=('vallumd-git')
conflicts=('vallumd')
source=("git+https://codeberg.org/stintel/vallumd.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    sed -i 's|DESTINATION sbin|DESTINATION bin|' CMakeLists.txt
    sed -i 's|/usr/sbin/vallumd|/usr/bin/vallumd|' init/vallumd.service
    sed -i '/^Description=/a Documentation=https://codeberg.org/stintel/vallumd' init/vallumd.service
    sed -i 's|^Description=.*|Description=Centralize and distribute Fail2ban IP blacklists over MQTT|' init/vallumd.service
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 conf/vallumd "${pkgdir}/etc/default/vallumd"
    install -Dm644 init/vallumd.service "${pkgdir}/usr/lib/systemd/system/vallumd.service"
}
