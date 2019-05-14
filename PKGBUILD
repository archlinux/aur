# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=system76-firmware-daemon-git
pkgver=1.0.5.r0.gc85943a
pkgrel=1
pkgdesc="System76 Firmware Daemon provides a daemon for installing firmware updates."
arch=('any')
url="https://github.com/pop-os/system76-firmware"
license=('GPL')
install=system76-firmware-daemon.install
depends=('dbus' 'systemd' 'openssl-1.0')
makedepends=('rust')
conflicts=('system76-driver<=17.10.32' 'system76-firmware-daemon')
provides=('system76-firmware-daemon')
source=("${pkgname}::git://github.com/pop-os/system76-firmware.git"
		"system76-firmware-daemon.install")
sha256sums=('SKIP'
            '1d2604a2d4273adf05752529d6af917abba7e64d9e04e3519d9c438632cfcf5b')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"

	# Build and install base package
	#OPENSSL_LIB_DIR="/usr/lib/openssl-1.0" OPENSSL_INCLUDE_DIR="/usr/include/openssl-1.0" cargo build --release --verbose
	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}"

	# Install daemons
	install -m755 -D target/release/system76-firmware-daemon ${pkgdir}/usr/lib/system76-firmware/system76-firmware-daemon

	# Install systemd unit files
	install -m644 -D debian/system76-firmware-daemon.service ${pkgdir}/usr/lib/systemd/system/system76-firmware-daemon.service

	# Install scripts and configuration
	install -m755 -D data/system76-firmware-daemon.conf ${pkgdir}/usr/share/dbus-1/system.d/system76-firmware-daemon.conf
}
