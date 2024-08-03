# Maintainer: bbaster <bbaster at tutanota dot org>

pkgname=flashpoint-launcher-bin
pkgver=13_20240425m
_launcherver=${pkgver%_*}
_timestamp=${pkgver#*_}
pkgrel=3
pkgdesc="Launcher for Flashpoint"
arch=('x86_64')
url="https://flashpointarchive.org/"
license=('MIT')
depends=(
	'pulse-native-provider'
	'lib32-libxcomposite'
	'gtk3'
	'nss'
	'php'
	'wine'
	'bash'
)
makedepends=(
	'p7zip'
)
optdepends=(
	'gtk2: native Flash support'
	'libxt: native Flash support'
)
backup=('opt/Flashpoint/Launcher/config.json')
source=("https://download.unstable.life/upload/fp${_launcherver//./}_linux_${_timestamp}.7z")
noextract=("${source[0]##*/}") #bsdtar can't extract the package for some reason
sha256sums=("b059a8076841a582229c90ced7bc016f08046613de105be057a9913ad6ae57d3")

prepare() {
	7z x "${source[0]##*/}"
}

package() {
	echo "Copying data files ..."
	mkdir -vp "${pkgdir}/opt/Flashpoint/"
	cp -rp "${srcdir}/".* "${srcdir}/"* "${pkgdir}/opt/Flashpoint/"

	echo "Linking launcher..."
	mkdir -vp "${pkgdir}/usr/bin"
	ln -sv "/opt/Flashpoint/start-flashpoint.sh" "${pkgdir}/usr/bin/flashpoint-launcher"

	echo "Installing licenses, desktop file and icon..."
	mkdir -vp "${pkgdir}/usr/share/licenses"
	cp -rp "${pkgdir}/opt/Flashpoint/Launcher/licenses/" "${pkgdir}/usr/share/licenses/Flashpoint"
	install -Dm644 "${srcdir}/../flashpoint.desktop" "${pkgdir}/usr/share/applications/flashpoint.desktop"
	install -Dm644 "${srcdir}/../icon.png" "${pkgdir}/usr/share/pixmaps/flashpoint.png"

	echo "Adding check to launch script..."
	sed -i -E '7s/(.*)/\1\n\
if [[ "$(stat -c %U \/opt\/Flashpoint)" != "$USER" ]]\; then\
\techo -e "WARNING: Flashpoint directory is not owned by current user! Expect issues. \
Run \\"sudo USER=\\$USER chown -R \\$USER \/opt\/Flashpoint\/\\" to correct this."\nfi\n/g' "${pkgdir}/opt/Flashpoint/start-flashpoint.sh"
}
