# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mkinitcpio-archlogo
pkgver=0.2.0.r7.g002175a
pkgrel=1
pkgdesc='Add colored Arch Linux ASCII art logo to early boot process'
arch=('any')
url='https://github.com/eworm-de/mkinitcpio-archlogo'
depends=('mkinitcpio')
makedepends=('git')
license=('GPL')
install=mkinitcpio-archlogo.install
source=('git://github.com/eworm-de/mkinitcpio-archlogo.git')
backup=('etc/archlogo.conf')
sha256sums=('SKIP')

pkgver() {
	cd mkinitcpio-archlogo/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd mkinitcpio-archlogo/

	# install install script and unit file
	install -D -m0644 install/archlogo ${pkgdir}/usr/lib/initcpio/install/archlogo
	install -D -m0644 systemd/archlogo.service ${pkgdir}/usr/lib/systemd/system/archlogo.service

	# install hook for plain old script based initramfs
	install -D -m0755 hook/archlogo ${pkgdir}/usr/lib/initcpio/hooks/archlogo

	# install config
	install -D -m0644 etc/archlogo.conf ${pkgdir}/etc/archlogo.conf

	# install logos
	install -D -m0644 share/archlogo ${pkgdir}/usr/share/archlogo/archlogo
	install -D -m0644 share/archlogo2 ${pkgdir}/usr/share/archlogo/archlogo2
}

