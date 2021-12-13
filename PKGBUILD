# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Timothée Ravier <tim at siosm dot fr>
# Contributor: Tom <reztho at archlinux dot org>

pkgname=tuned
pkgver=2.16.0
pkgrel=2
pkgdesc='Daemon that performs monitoring and adaptive configuration of devices in the system'
arch=('any')
url="https://github.com/redhat-performance/${pkgname}"
license=('GPL')
depends=('dbus-glib' 'ethtool' 'gawk' 'hdparm' 'polkit' 'python-configobj' 'python-dbus' 'python-gobject' 'python-linux-procfs' 'python-perf' 'python-pyudev')
optdepends=('virt-what: For use with virtual machines' 'systemtap: Disk and net statistic monitoring systemtap scripts')
makedepends=('desktop-file-utils')
backup=('etc/tuned/active_profile')
install="${pkgname}.install"
source=("https://github.com/redhat-performance/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7f0b858c35fb9695703f04177af074555de59a7a3e94ec0b7e28357584d4502d')

prepare() {
	cd "${pkgname}-${pkgver}"
	mv libexec lib

	sed -i 's/libexec/lib/g' Makefile
	sed -i 's/sbin/bin/g' Makefile
}

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	rm -r "${pkgdir}"/{run,var}

	install -Dm644 tuned.service "${pkgdir}/usr/lib/systemd/system/"
}
