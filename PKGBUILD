# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=system76-driver
pkgver=15.04.7
pkgrel=1
pkgdesc="System76 Driver provides drivers, restore, and regression support for System76 computers"
arch=('any')
url="https://launchpad.net/system76-driver"
license=('GPL')
install="${pkgname}.install"
depends=('python>=3.4' 'python-gobject' 'python-dbus' 'dmidecode')
makepdepends=('patch')
optdepends=(
	'pm-utils: For powermanagement features'
	'gtk3: To launch System76 Driver GUI'
	'grub: To apply kernel boot time parameters'
	'polkit: runnning System76 Driver GUI from  application menu'
	'pulseaudio: To apply microphone fix')
source=("https://launchpad.net/~system76-dev/+archive/stable/+files/${pkgname}_${pkgver}.tar.gz"
	'system76.service' 'galu1.patch' 'grub.patch' 'gtk.patch' 'cli.patch')
sha1sums=('356bb13cef2d41a6ab82d5ec7d5bf722aedbf2d0'
          'cf763432441c3da0563eee041145a02109f2bb3a'
          '6fb7b26f77098424586424bd35522882412ddd09'
          'dd95fd7317786c9fc9b0233c248d192832a83fe0'
          'b276d403153adae45fb71c2e1a7a0340cab27e74'
          '5175c3a54efefcf4a3526094e33a1281cb59c4eb')

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
	rm -rf ${pkgdir}/usr/lib/python3.4/site-packages/system76driver/tests/
} 
