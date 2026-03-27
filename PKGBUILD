# Maintainer: hmarcelino <henry_marcelino at outlook dot com>
# Contributor: bbaster <bbaster at tutanota dot org>

pkgname=flashpoint-launcher-bin
pkgver=14.0.3_20251201
_launcherver=${pkgver%_*}
_timestamp=${pkgver#*_}

pkgrel=2
pkgdesc="An archive for games and animations from the web."
arch=('x86_64')
url="https://flashpointarchive.org/"
license=('MIT')

provides=(flashpoint-launcher)
conflicts=(flashpoint-launcher)

depends=(
	'pulse-native-provider'
	'lib32-libxcomposite'
	'lib32-libpulse'
	'gtk3'
	'nss'
	'php'
	'7zip'
	'bash'
)

optdepends=(
	'gtk2: native Flash support'
	'libxt: native Flash support'
)

options=(
    '!strip'
    '!emptydirs'
)

source=("https://download.flashpointarchive.org/upload/fp${_launcherver}_lin_${_timestamp}.7z")
sha256sums=('f393a98c5c35e229a744c102b0cb53270b1b4f1b3ebd40d604f98323444a4b1f')

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
    chmod +x "./setup-desktop-entry.sh"
    ENTRY="${srcdir}/flashpoint-archive.desktop" FP_DIR="/opt/Flashpoint/" "./setup-desktop-entry.sh"

	echo "Installing licenses and desktop file..."
	mkdir -vp "${pkgdir}/usr/share/licenses"
	cp -rp "${pkgdir}/opt/Flashpoint/Launcher/licenses/" "${pkgdir}/usr/share/licenses/flashpoint"
	install -Dm644 "${srcdir}/flashpoint-archive.desktop" "${pkgdir}/usr/share/applications/flashpoint-archive.desktop"

    echo "Removing unneeded src folder..."
    rm -rf "${pkgdir}/opt/Flashpoint/src"

    echo "Removing unneeded Libraries folder..."
    rm -rf "${pkgdir}/opt/Flashpoint/Libraries"
}
