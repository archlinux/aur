# Maintainer: agentcobra <agentcobra@free.fr>
# Contributor: Nover <novares.x@gmail.com>

# Creator Blade <contact@blade-group.com>

# Made with https://github.com/NicolasGuilloux/blade-shadow-beta

_commit=9add3366d25530d51d168608c54b5339b64d2a4e
pkgname=shadow-beta
pkgver=4.8.6
pkgrel=1
pkgdesc="Shadow Bêta application"
arch=('x86_64')
url="http://shadow.tech"
license=('unknown')
depends=('desktop-file-utils' 'freetype2' 'libuv' 'gconf' 'hicolor-icon-theme' 'json-c' 'libappindicator-gtk2' 'libbsd' 'libcurl-gnutls' 'libdrm' 'libnotify' 'libva' 'libxtst' 'nss' 'opus' 'qt5-base' 'qt5-svg' 'sdl2' 'libappindicator' 'libcurl-compat' 'sdl' 'gcc7-libs' 'ttf-dejavu' 'libxss' 'libsndio-61-compat' 'gnome-keyring')
provides=(shadow-beta)
source=("$pkgname-$pkgver-$pkgrel.zip::https://update.shadow.tech/launcher/preprod/linux/ubuntu_18.04/ShadowBeta.zip")
md5sums=('c2837f61b3b7dd190fcb38a1e9b73c88')
install=$pkgname.install

# Extract the zip file and prepare for the build
prepare() {
	### Create working folder
	mkdir shadow

	### Extract zip file
	bsdtar -x -f "$pkgname-$pkgver-$pkgrel.zip" -C shadow

	### Extract the deb
	ar xv shadow/Shadow*.deb

	### Extract the data
	bsdtar xf data.tar.xz
}

# Build the package
package() {
	# Move de icons
	mv "${srcdir}/usr/share/icons/hicolor/0x0/" "${srcdir}/usr/share/icons/hicolor/1024x1024/"

	# Make a copy of the icons
	echo "cp \"${srcdir}/usr/share/icons/hicolor/1024x1024/apps/*\" \"${srcdir}/usr/share/icons/\""
	cp ${srcdir}/usr/share/icons/hicolor/1024x1024/apps/* "${srcdir}/usr/share/icons/"

	# Move the files
	mv "${srcdir}/usr" "${pkgdir}"
	mv "${srcdir}/opt" "${pkgdir}"

	# Fix rights
	chmod -R g-w "${pkgdir}/usr"
	chmod -R g-w "${pkgdir}/opt"

	# Move to shortcut directory
	cd "${pkgdir}/usr/share/applications/"

	sed -i -e 's/^Categories=.*$/Categories=Games;Game;Utility;Virtualization/g' shadow-preprod.desktop
	sed -i -e 's/^Exec=.*$/& --no-sandbox/g' shadow-preprod.desktop
	mv shadow-preprod.desktop "${srcdir}/shadow-beta.desktop"

	# Move the source directory
	cd "${srcdir}"

	chmod g-w "${srcdir}/shadow-beta.desktop"
	mv "${srcdir}/shadow-beta.desktop" "${pkgdir}/usr/share/applications/shadow-beta.desktop"
}
