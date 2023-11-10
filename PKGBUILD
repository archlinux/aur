# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
_pkgname="qflipper"
pkgname=${_pkgname}-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="Desktop application for updating Flipper Zero firmware via PC - Binary release (extracted from official AppImage)"
arch=('x86_64')
url="https://update.flipperzero.one/"
license=('GPL3')
depends=(
  'libusb'
  'qt6-5compat'
  'qt6-quickcontrols2'
  'qt6-serialport'
  'qt6-svg'
)
makedepends=('fuse2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_filename="qFlipper-x86_64-${pkgver}.AppImage"
source=("https://update.flipperzero.one/builds/qFlipper/${pkgver}/${_filename}")
sha256sums=('a2197cf7ec588b700cb6ffd3b6feada2c0f5febcb2f0c5d7dce3b8cbbef4bc4d')

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
