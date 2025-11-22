# Maintainer: bbaster <bbaster at tutanota dot org>

pkgname=flashpoint-launcher-bin
pkgver=14.0.3_20251103
_launcherver=${pkgver%_*}
_timestamp=${pkgver#*_}

pkgrel=5
pkgdesc="An archive for games and animations from the web."
arch=('x86_64')
url="https://flashpointarchive.org/"
license=('MIT')

depends=(
	'pulse-native-provider'
	'lib32-libxcomposite'
	'lib32-libpulse'
	'gtk3'
	'nss'
	'php'
	'7zip'
	'wine'
	'bash'
)

optdepends=(
	'gtk2: native Flash support'
	'libxt: native Flash support'
)

options=(
    !strip
)

source=("https://download.flashpointarchive.org/upload/fp${_launcherver}_lin_${_timestamp}.7z")
sha256sums=('b3ff524f6ba3157b1b0661207e24ae6c478b12fccccca55720c2c31d3034f509')

prepare() {
 	patch -p1 -i ../setup-desktop-entry.patch -d "${srcdir}"
 	patch -p1 -i ../start-flashpoint.patch -d "${srcdir}"
}

package() {
	echo "Copying data files ..."
	mkdir -vp "${pkgdir}/opt/Flashpoint/"
	find "${srcdir}/" -maxdepth 1 -not -name "fp${_launcherver}_lin_main_${_timestamp}.7z" -exec cp -rp {} "${pkgdir}/opt/Flashpoint/" \;

	echo "Creating a launcher script wrapper..."
	mkdir -vp "${pkgdir}/usr/bin"
	cp -p ../flashpoint-launcher.sh "${pkgdir}/usr/bin/flashpoint-launcher"

	echo "Creating the desktop file..."
    ENTRY="${srcdir}/flashpoint-archive.desktop" FP_DIR="/opt/Flashpoint/" "./setup-desktop-entry.sh"

	echo "Installing licenses and desktop file..."
	mkdir -vp "${pkgdir}/usr/share/licenses"
	cp -rp "${pkgdir}/opt/Flashpoint/Launcher/licenses/" "${pkgdir}/usr/share/licenses/flashpoint"
	install -Dm644 "${srcdir}/flashpoint-archive.desktop" "${pkgdir}/usr/share/applications/flashpoint-archive.desktop"
}
