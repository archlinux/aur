# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Timothée Ravier <tim at siosm dot fr>
# Contributor: Tom <reztho at archlinux dot org>

pkgname=tuned
pkgver=2.9.0
pkgrel=2
pkgdesc='Daemon that performs monitoring and adaptive configuration of devices in the system'
arch=('any')
url="https://github.com/redhat-performance/${pkgname}"
license=('GPL')
depends=('ethtool' 'python2-configobj' 'python2-pyudev' 'python2-gobject2' 'python2-decorator' 'python2-dbus' 'python2-gobject' 'python2-linux-procfs' 'dbus-glib')
optdepends=('virt-what: For use with virtual machines' 'systemtap: Disk and net statistic monitoring systemtap scripts')
makedepends=('desktop-file-utils')
backup=('etc/tuned/active_profile')
install="${pkgname}.install"
source=("https://github.com/redhat-performance/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0863896aff15c924afe7ee9449d16121c840d8bf768055aa749d0d050518efe5')

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	mv "${pkgdir}"/usr/sbin/* "${pkgdir}"/usr/bin/
	mv "${pkgdir}"/usr/libexec/tuned/* "${pkgdir}"/usr/lib/tuned/
	rm -r "${pkgdir}"/run "${pkgdir}"/usr/sbin "${pkgdir}"/usr/libexec

	find "${pkgdir}"/usr/bin/ -type f -exec sed -i 's@#!/usr/bin/python@#!/usr/bin/python2@' {} \;

	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/tuned.service" "${pkgdir}/usr/lib/systemd/system/tuned.service"
}
