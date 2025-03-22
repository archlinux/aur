# Maintainer: bbaster <bbaster at tutanota dot org>

pkgname=flashpoint-launcher-bin
pkgver=14.0.1_20250222
_launcherver=${pkgver%_*}
_timestamp=${pkgver#*_}

pkgrel=4
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
source=("https://download.unstable.life/upload/fp${_launcherver}_lin_main_${_timestamp}.7z")
sha256sums=('bab843b8422da500056698819aa6752804eedb8ba130380403e4f49532d8537e')

prepare() {
	patch -p1 -i ../setup-desktop-entry.patch -d "${srcdir}"
	patch -p1 -i ../start-flashpoint.patch -d "${srcdir}"
}

package() {
	echo "Copying data files ..."
	mkdir -vp "${pkgdir}/opt/Flashpoint/"
	find "${srcdir}/" -maxdepth 1 -not -name "fp${_launcherver}_lin_main_${_timestamp}.7z" -exec cp -rp {} "${pkgdir}/opt/Flashpoint/" \;

	echo "Linking launcher..."
	mkdir -vp "${pkgdir}/usr/bin"
	ln -sv "/opt/Flashpoint/start-flashpoint.sh" "${pkgdir}/usr/bin/flashpoint-launcher"
	
	echo "Creating the desktop file..."
	env "${srcdir}/setup-desktop-entry.sh"

	echo "Installing licenses and desktop file..."
	mkdir -vp "${pkgdir}/usr/share/licenses"
	cp -rp "${pkgdir}/opt/Flashpoint/Launcher/licenses/" "${pkgdir}/usr/share/licenses/flashpoint"
	install -Dm644 "${srcdir}/Flashpoint.desktop" "${pkgdir}/usr/share/applications/flashpoint.desktop"

}
