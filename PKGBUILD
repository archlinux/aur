# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
_pkgname="qflipper"
pkgname=${_pkgname}-bin
pkgver=1.3.3
pkgrel=3
pkgdesc="Desktop application for updating Flipper Zero firmware via PC - Packaged from official AppImage binaries"
arch=('x86_64')
url="https://update.flipperzero.one/"
license=('GPL-3.0-only')
depends=(
  'openssl-1.1'
  'libusb'
  'qt6-5compat'
  'qt6-declarative'
  'qt6-serialport'
  'qt6-svg'
)
makedepends=('fuse2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_filename="qFlipper-x86_64-${pkgver}.AppImage"
source=("https://update.flipperzero.one/builds/qFlipper/${pkgver}/${_filename}")
sha256sums=('6b72224ad7bd8f9d7121ac6553c5d0d233956f740bb8f64a73053005c79970a4')

prepare() {
	chmod +x "${_filename}"
	./${_filename} --appimage-extract > /dev/null

	# Archlinux use uucp group instead of dialout
	sed -i 's/dialout/uucp/g' squashfs-root/usr/lib/udev/rules.d/42-flipperzero.rules
}

package() {
	cd squashfs-root
	install -Dm 755 usr/bin/qFlipper "${pkgdir}/usr/bin/qFlipper"
	install -Dm 755 usr/bin/qFlipper-cli "${pkgdir}/usr/bin/qFlipper-cli"

	install -Dm 644 usr/lib/udev/rules.d/42-flipperzero.rules "${pkgdir}/usr/lib/udev/rules.d/42-flipperzero.rules"

	install -Dm 644 usr/share/icons/hicolor/512x512/apps/qFlipper.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/qFlipper.png"
	install -Dm 644 usr/share/applications/qFlipper.desktop "${pkgdir}/usr/share/applications/qFlipper.desktop"
}
