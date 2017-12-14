# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Corey Hinshaw <coreyhinshaw@gmail.com>

pkgname=system76-driver
pkgver=17.10.9
pkgrel=1
pkgdesc="System76 Driver provides drivers, restore, and regression support for System76 computers"
arch=('any')
url="https://launchpad.net/system76-driver"
license=('GPL')
install="${pkgname}.install"
depends=('python>=3.6' 'python-gobject' 'python-dbus' 'python-evdev' 'dmidecode')
makepdepends=('python-pyflakes' 'patch')
optdepends=(
	'pm-utils: For powermanagement features'
	'gtk3: To launch System76 Driver GUI'
	'grub: To apply kernel boot time parameters'
	'polkit: runnning System76 Driver GUI from  application menu'
	'pulseaudio: To apply microphone fix'
	'xorg-xbacklight: To use the backlight service')
source=("https://launchpad.net/~system76-dev/+archive/stable/+files/${pkgname}_${pkgver}.tar.xz"
	'galu1.patch' 'gtk.patch' 'cli.patch' 'hidpi.patch')
sha1sums=('15d0c347bfdb83d6b8b7ad7160eaafede273e49b'
          'ea8d53a80a26eb05b367f27996c8ce715aafba1e'
          'bf0c37a6226858c768e8ce2c9c3c3801aef14c0e'
          '92f0de2acea6ac69c36378c7139fb84a7eaf7842'
          'acbcc10d4b4fc94bc33e9956fb0f4f335136beab')


package() {
	cd ${srcdir}/master_artful

	###########
	# Install #
	###########

	# Build and install base package
	python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1

	# Install daemons and systemd unit files
	# Note: system76-driver* service files shortened to system76*
	install -m755 -D system76-daemon ${pkgdir}/usr/lib/${pkgname}/system76-daemon
	install -m755 -D system76-backlight-daemon ${pkgdir}/usr/lib/${pkgname}/system76-backlight-daemon
	install -m755 -D system76-hidpi-daemon ${pkgdir}/usr/lib/${pkgname}/system76-hidpi-daemon

	# Install systemd unit files
	# Note: system76-driver* service files shortened to system76*
	install -m644 -D debian/system76-driver.service ${pkgdir}/usr/lib/systemd/system/system76.service
	install -m644 -D debian/system76-driver-backlight.service ${pkgdir}/usr/lib/systemd/user/system76-backlight.service
	install -m644 -D debian/system76-driver-hidpi.service ${pkgdir}/usr/lib/systemd/user/system76-hidpi.service
	install -m644 -D system76-driver-backlight.desktop ${pkgdir}/usr/share/applications/system76-backlight.desktop

	# Install scripts and configuration
	install -m755 -D system76-driver-pkexec ${pkgdir}/usr/bin/system76-driver-pkexec
	install -m755 -D system76-nm-restart ${pkgdir}/usr/lib/${pkgname}/system76-nm-restart
	install -m644 -D com.system76.pkexec.system76-driver.policy ${pkgdir}/usr/share/polkit-1/actions/com.system76.pkexec.system76-driver.policy

	# Create /var/lib/system76-driver directory for brightness settings saving
	install -m755 -d ${pkgdir}/var/lib/${pkgname}

	# Clean up
	rm -rf ${pkgdir}/usr/lib/python*/site-packages/system76driver/{__pycache__,tests}

	#################
	# Apply patches #
	#################

	cd ${pkgdir}

	# patch for cli version - enable override vendor/model via /etc/system76-daemon.json
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/cli.patch 
	# galu1 model-specific patch
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/galu1.patch 
	# enabling "Restore System" button if all changes applied
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/gtk.patch
	# Remove Ubuntu-specific service target
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/hidpi.patch
} 
