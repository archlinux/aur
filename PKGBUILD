# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>

pkgname=system76-driver
pkgver=18.10.5
pkgrel=1
pkgdesc="System76 Driver provides drivers, restore, and regression support for System76 computers"
arch=('any')
url="https://github.com/pop-os/system76-driver"
license=('GPL')
install="${pkgname}.install"
depends=(
	'python>=3.6'
	'python-cffi'
	'python-dbus'
	'python-evdev'
	'python-gobject'
	'python-pynacl'
	'python-systemd'
	'python-xlib'
	'dmidecode'
	'at'
	'system76-dkms'
	'system76-io-dkms'
	'system76-firmware-daemon')
makepdepends=(
	'python-pyflakes')
optdepends=(
	'pm-utils: For power management features'
	'gtk3: To launch System76 driver and firmware GUI'
	'grub: To apply kernel boot time parameters'
	'polkit: Run System76 Driver GUI from application menu'
	'pulseaudio: To apply microphone fix'
	'xorg-xhost: To enable GUI applications on Wayland'
	'xorg-xbacklight: To use the backlight service')
source=(
	"https://github.com/pop-os/${pkgname}/archive/${pkgver}.tar.gz"
	'galu1.patch'
	'gtk.patch'
	'cli.patch'
	'wayland.patch')
sha1sums=(
  '27af606140b2edba51e94ae138cc130508e1f1f2'
  'ddc85f9b062eb89c2c6fef0c6d7c68a28f419760'
  '45b4601ed3d9d80a01d5179628b1502caa9d7e6f'
  '916e0eeda26e00bd0372c1ffc7c5368cda9d46a1'
  'c3244a1fe8470b3e39f9a604bc40db235388893b')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}

	# patch for cli version - enable override vendor/model via /etc/system76-daemon.json
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/cli.patch

	# galu1 model-specific patch
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/galu1.patch

	# enabling "Restore System" button if all changes applied
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/gtk.patch

	# Use xhost for GUI apps on Wayland
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/wayland.patch
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# Build and install base package
	python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1

	# Install daemons and executables
	install -m755 -D system76-daemon ${pkgdir}/usr/lib/${pkgname}/system76-daemon
	install -m755 -D system76-backlight-daemon ${pkgdir}/usr/lib/${pkgname}/system76-backlight-daemon
	install -m755 -D system76-firmware-dialog ${pkgdir}/usr/lib/${pkgname}/system76-firmware-dialog
	install -m755 -D system76-driver-pkexec ${pkgdir}/usr/bin/system76-driver-pkexec
	install -m755 -D system76-firmware ${pkgdir}/usr/bin/system76-firmware
	install -m755 -D system76-firmware-pkexec ${pkgdir}/usr/bin/system76-firmware-pkexec

	# Install systemd unit files
	# Note: system76-driver* service files shortened to system76*
	install -m644 -D debian/system76-driver.service ${pkgdir}/usr/lib/systemd/system/system76.service
	install -m644 -D debian/system76-driver-backlight.service ${pkgdir}/usr/lib/systemd/user/system76-backlight.service

	# Install scripts and configuration
	install -m755 -D system76-nm-restart ${pkgdir}/usr/lib/${pkgname}/system76-nm-restart
	install -m644 -D com.system76.pkexec.system76-driver.policy ${pkgdir}/usr/share/polkit-1/actions/com.system76.pkexec.system76-driver.policy
	install -m644 -D com.system76.pkexec.system76-firmware.policy ${pkgdir}/usr/share/polkit-1/actions/com.system76.pkexec.system76-firmware.policy

	# Install desktop shortcuts
	install -m644 -D system76-driver-backlight.desktop ${pkgdir}/usr/share/applications/system76-backlight.desktop
	install -m644 -D system76-firmware.desktop ${pkgdir}/usr/share/applications/system76-firmware.desktop

	# Create /var/lib/system76-driver directory for brightness settings saving
	install -m755 -d ${pkgdir}/var/lib/${pkgname}

	# Clean up
	rm -rf ${pkgdir}/usr/lib/python*/site-packages/system76driver/{__pycache__,tests}
} 
