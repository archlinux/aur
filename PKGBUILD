# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Timothée Ravier <tim at siosm dot fr>
# Contributor: Tom <reztho at archlinux dot org>

pkgname=tuned
pkgver=2.22.0
pkgrel=1
pkgdesc='Daemon that performs monitoring and adaptive configuration of devices in the system'
arch=('any')
url="https://github.com/redhat-performance/${pkgname}"
license=('GPL')
depends=('dbus-glib' 'ethtool' 'gawk' 'hdparm' 'polkit' 'python-configobj' 'python-dbus' 'python-gobject' 'python-linux-procfs' 'python-perf' 'python-pyudev')
optdepends=('virt-what: For use with virtual machines' 'systemtap: Disk and net statistic monitoring systemtap scripts')
makedepends=('desktop-file-utils')
backup=('etc/tuned/active_profile')
install="${pkgname}.install"
source=("https://github.com/redhat-performance/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('653f946e8eff57eaa7e26b05c9215d60c8dcec6760b4a41a2855328e86b65f4dcbc0b2fd7d9f9355d00aae93f601c035a38d4e1611f30cb5003b417e31bea4dc')

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

	python -m compileall -d /usr/lib "${pkgdir}/usr/lib"
	python -O -m compileall -d /usr/lib "${pkgdir}/usr/lib"

	install -Dm644 tuned.service "${pkgdir}/usr/lib/systemd/system/"
}
