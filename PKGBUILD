# Maintainer: gilbus <aur(AT)tinkershell.eu>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=thermald
_pkgname=thermal_daemon
pkgver=1.9
pkgrel=2
pkgdesc="The Linux Thermal Daemon program from 01.org"
arch=('x86_64')
url="https://01.org/linux-thermal-daemon"
license=('GPL2')
makedepends=('systemd' 'python')
depends=('dbus-glib' 'libxml2')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/intel/${_pkgname}/archive/v${pkgver}.tar.gz"
        'modules-load-thermald.conf')
sha256sums=('d8f40bce80fb8303a0c103d2531d0e4cc1caad0a8d027cd26a1b5b10cdaae4e3'
            '0155e1eb459306d251a5a049ffc6c11e144fa8caa75901ac5fa20bd52e05d515')

build() {
  cd ${_pkgname}-${pkgver}
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/modules-load-thermald.conf "${pkgdir}"/usr/lib/modules-load.d/thermald.conf
}
