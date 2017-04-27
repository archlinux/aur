# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Timothée Ravier <tim at siosm dot fr>
# Contributor: Tom <reztho at archlinux dot org>

pkgname=tuned
pkgver=2.8.0
pkgrel=1
pkgdesc='Daemon that performs monitoring and adaptive configuration of devices in the system'
arch=('any')
url='https://fedorahosted.org/tuned/'
license=('GPL')
depends=('ethtool' 'python2-configobj' 'python2-pyudev' 'python2-gobject2' 'python2-decorator' 'python2-dbus' 'python2-gobject' 'dbus-glib')
optdepends=('virt-what' 'systemtap')
makedepends=('git')
backup=('etc/tuned/active_profile')
install="${pkgname}.install"
source=("https://jskarvad.fedorapeople.org/${pkgname}/download/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('3da453af1d1f13ac46966499b1f1373cf3718bdb3207f82aca8b66e894e69bc7')

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	mv "${pkgdir}"/usr/sbin/* "${pkgdir}"/usr/bin/
	mv "${pkgdir}"/usr/libexec/tuned/* "${pkgdir}"/usr/lib/tuned/
	rm -r "${pkgdir}"/run "${pkgdir}"/usr/sbin "${pkgdir}"/usr/libexec

	find "${pkgdir}"/usr/bin/ -type f -exec sed -i 's@#!/usr/bin/python@#!/usr/bin/python2@' {} \;

	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/tuned.service" "${pkgdir}/usr/lib/systemd/system/tuned.service"
}
