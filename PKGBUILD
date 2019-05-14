# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=system76-driver-git
pkgver=19.04.8.r2.g12fc202
pkgrel=1
pkgdesc="System76 Driver for System76 computers"
arch=('any')
url="https://github.com/pop-os/system76-driver"
license=('GPL')
install=system76-driver-git.install
conflicts=("system76-driver")
provides=("system76-driver")
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
makepdepends=('python-pyflakes')
optdepends=(
	'pm-utils: For power management features'
	'gtk3: To launch System76 driver and firmware GUI'
	'grub: To apply kernel boot time parameters'
	'polkit: Run System76 Driver GUI from application menu'
	'pulseaudio: To apply microphone fix'
	'xorg-xhost: To enable GUI applications on Wayland'
	'xorg-xbacklight: To use the backlight service')
source=("${pkgname}::git+https://github.com/pop-os/system76-driver.git"
        'galu1.patch'
        'gtk.patch'
        'cli.patch'
        'wayland.patch')
sha256sums=('SKIP'
            '2ccf53ec0ffdeea00930d218253f5b3db2bdc7d3405e8353caabc36107f3ab26'
            '14c6d669b5a4a5b4a306978ebdad7e26d939e8e559de52274aec26cd5b2ea853'
            'ef027346c439561dc01f906ae7bd961100aedf9125fd86bb0eb89a87b683fdc3'
            '20c9ee9420fd23cd719dfb8a35cb57c434df0d7e6a1ca8c79c8b900eec2f3dd0')

pkgver() {
	cd ${pkgname}

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${pkgname}

	# patch for cli version - enable override vendor/model via /etc/system76-daemon.json
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/cli.patch

	# galu1 model-specific patch
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/galu1.patch

	# enabling "Restore System" button if all changes applied
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/gtk.patch

	# Use xhost for GUI apps on Wayland
	patch --no-backup-if-mismatch -Np1 -i ${srcdir}/wayland.patch

    # Fix-up location paths
    find . -type f -exec sed -i -re "s|/usr/lib/system76-driver/|/usr/lib/system76-driver-git/|g" "{}" \;
}

package() {
    cd ${pkgname}

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

