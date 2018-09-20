# Maintainer: agentcobra <agentcobra@free.fr>
# Contributor: Nover <novares.x@gmail.com>

# Made with https://github.com/NicolasGuilloux/blade-shadow-beta

pkgname=shadow-beta
pkgver=0.7.6
pkgrel=8
pkgdesc="Shadow launcher"
arch=('x86_64')
url="http://shadow.tech"
license=('unknown')
depends=('desktop-file-utils' 'freetype2' 'gcc5' 'gconf' 'hicolor-icon-theme' 'json-c' 'libappindicator-gtk2' 'libbsd' 'libcurl-gnutls' 'libdrm' 'libnotify' 'libva' 'libxtst' 'nss' 'opus' 'qt5-base' 'qt5-svg' 'sdl2' 'libappindicator' 'libcurl-compat' 'sdl' 'gcc7-libs' 'ttf-dejavu')
provides=(shadow-beta)
source=('https://macosx.update.blade-group.fr/mpl/linux/beta/bionic/shadowbeta.deb')
md5sums=('6fc188e0e818c9d3af6dbb2d51a88f91')
install=INSTALL

# Get the version as a datetime
pkgver() {
	# Get the version of the latest Linux version
	url="https://macosx.update.blade-group.fr/mpl/linux/beta/bionic/latest-linux.yml"
	content=$(curl -s -L $url)

	# Set the pkgver
	echo "$content" | grep "version" | sed -e 's,version: ,,g'
}

# Build the package
package() {

	### Extract the deb
	bsdtar xf data.tar.xz

	chmod -R g-w usr
	mv usr "${pkgdir}"

	chmod -R g-w opt
	mv opt "${pkgdir}"

	# Move the source directory
	cd ../

	### Move the Wrapper
	chmod g-w wrapper.pl
	chmod +x wrapper.pl
	mv wrapper.pl "${pkgdir}/opt/Shadow Beta/shadow-wrapper.pl"

	### Move the Report.pl
	chmod g-w report.pl
	chmod +x report.pl
	mv report.pl "${pkgdir}/opt/Shadow Beta/report.pl"

	### Edit launcher
	sed -e 's/^Exec=.*$/Exec="\/opt\/Shadow Beta\/shadow-wrapper.pl"/g' -e 's/^Categories=.*$/Categories=Games;Utility;Virtualization/g' "${pkgdir}/usr/share/applications/shadow-beta.desktop" > shadow-beta.desktop
	chmod g-w shadow-beta.desktop

	rm "${pkgdir}/usr/share/applications/shadow-beta.desktop"
	mv shadow-beta.desktop "${pkgdir}/usr/share/applications/shadow-beta.desktop"


	### Fix stuff

	# Create lib directory
	mkdir -p "${pkgdir}/usr/lib"

	# Correct Libjson-c
	if [ ! -f /usr/lib/libjson-c.so.3 ]; then
	    ln -f -s -r "libjson-c.so" "${pkgdir}/usr/lib/libjson-c.so.3"
	fi

	# Correct Libubsan
	if [ ! -f /usr/lib/libubsan.so.0 ]; then
		ln -f -s -r "gcc/x86_64-pc-linux-gnu/7.3.1/libubsan.so.0" "${pkgdir}/usr/lib/libubsan.so.0"
	fi
}
