# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=system76-driver
pkgver=16.10.13
pkgrel=1
pkgdesc="System76 Driver provides drivers, restore, and regression support for System76 computers"
arch=('any')
url="https://launchpad.net/system76-driver"
license=('GPL')
install="${pkgname}.install"
depends=('python>=3.6' 'python-gobject' 'python-dbus' 'dmidecode')
makepdepends=('patch')
optdepends=(
	'pm-utils: For powermanagement features'
	'gtk3: To launch System76 Driver GUI'
	'grub: To apply kernel boot time parameters'
	'polkit: runnning System76 Driver GUI from  application menu'
	'pulseaudio: To apply microphone fix')
source=("https://launchpad.net/~system76-dev/+archive/stable/+files/${pkgname}_${pkgver}.tar.gz"
	'system76.service' 'galu1.patch' 'grub.patch' 'gtk.patch' 'cli.patch')
sha1sums=('b3a057ebaf4557da51a40ce2b95e6f3eecdbd6db'
          'cf763432441c3da0563eee041145a02109f2bb3a'
          'ea8d53a80a26eb05b367f27996c8ce715aafba1e'
          'b60a6f1554d806340f1f24bd3543561f8b4abf57'
          'bf0c37a6226858c768e8ce2c9c3c3801aef14c0e'
          '92f0de2acea6ac69c36378c7139fb84a7eaf7842')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	################
	# installation #
	################
	install -m644 -D system76-daemon ${pkgdir}/usr/lib/${pkgname}/system76-daemon
	python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
	install -m644 -D ${startdir}/system76.service ${pkgdir}/usr/lib/systemd/system/system76.service
	# installing system76-driver-pkexec script and polkit configuration
	install -m755 -D system76-driver-pkexec ${pkgdir}/usr/bin/system76-driver-pkexec
	install -m644 -D com.system76.pkexec.system76-driver.policy ${pkgdir}/usr/share/polkit-1/actions/com.system76.pkexec.system76-driver.policy
	# creating /var/lib/system76-driver directory for brightness settings saving
	install -m755 -d ${pkgdir}/var/lib/system76-driver 
	
	cd ${pkgdir}

	############
	# patching #
	############
	# patch for cli version - enable override vendor/model via /etc/system76-daemon.json
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/cli.patch 
	# galu1 model-specific patch
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/galu1.patch 
	# making grub optional - do not fail if /etc/default/grub file not found
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/grub.patch 
	# enabling "Restore System" button if all changes applied
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/gtk.patch 

	###########
	# cleanup #
	###########
	rm -rf ${pkgdir}/usr/lib/python*/site-packages/system76driver/{__pycache__,tests}
} 
