# Maintainer: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Timothée Ravier <tim at siosm dot fr>
# Contributor: Tom <reztho at archlinux dot org>

pkgname=tuned
pkgver=2.7.1
pkgrel=1
pkgdesc='Daemon that performs monitoring and adaptive configuration of devices in the system'
arch=('any')
url='https://fedorahosted.org/tuned/'
license=('GPL')
depends=('ethtool' 'python2-configobj' 'python2-pyudev' 'python2-gobject2' 'python2-decorator' 'python2-dbus' 'python2-gobject' 'dbus-glib')
optdepends=('virt-what' 'systemtap')
makedepends=('git')
provides=('tuned')
backup=('etc/tuned/active_profile')
install="${pkgname}.install"
source=("https://fedorahosted.org/releases/t/u/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('03333eda9f3744ec214b1c20d0f79528a6438dafd5c79ff459b411414491802d')

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

  mv "${pkgdir}"/usr/sbin/* "${pkgdir}"/usr/bin/
  mv "${pkgdir}"/usr/libexec/tuned/* "${pkgdir}"/usr/lib/tuned/
  rm -r "${pkgdir}"/run "${pkgdir}"/usr/sbin "${pkgdir}"/usr/libexec

  find "${pkgdir}"/usr/bin/ -type f -exec sed -i 's@#!/usr/bin/python@#!/usr/bin/python2@' {} \;

  install -Dm 0644 "${srcdir}"/${pkgname}-${pkgver}/tuned.service "${pkgdir}"/usr/lib/systemd/system/tuned.service
}

# vim:set ts=2 sw=2 et:
