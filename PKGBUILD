# Maintainer: J0k3r <moebius282 at gmail dot com>

pkgname=hotlinemiami
pkgver=1392944501
pkgrel=1
epoch=1
pkgdesc="A 2D top-down action video game"
url="http://hotlinemiami.com/"
license=('unknown')
# © Dennaton Interactive Design of the Future ™
arch=('i686' 'x86_64')
groups=("games")
_purgelibs=('libopenal.so.1' 'libCgGL.so' 'libCg.so')
# It appears like qt5 is no longer needed.
_purgelibs+=('libQt5Core.so.5' 'libQt5Gui.so.5' 'libQt5Widgets.so.5')
# If the program doesn't run, comment the line above. /\
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-openal' 'lib32-libvorbis' 'lib32-nvidia-cg-toolkit' 'lib32-glu' 'lib32-fontconfig' 'lib32-libxrandr' 'lib32-libxi')
else
	depends=('openal' 'libvorbis' 'nvidia-cg-toolkit' 'glu' 'fontconfig' 'libxrandr' 'libxi')
fi
changelog="${pkgname}.changelog"
_archivename="HotlineMiami_linux_${pkgver}"
source=("hib://${_archivename}.tar.gz"
		"${pkgname}.desktop"
		"${pkgname}.png"
		"${pkgname}.changelog")
sha256sums=('338268eecbd63ab5cf168d85ef6c7b36f2a6999adb359222b5372651b08ba805'
			'ca65c11bc9e06f438b2da2bb44c40424537e60b704656a155f672b16fde5f8de'
			'01432c725bd258761e67fe1db94531465ba0480e250724cf6b939669e13b0e8a'
			'SKIP')
noextract=("${source[0]:6}")
options=('strip')
PKGEXT=".pkg.tar"


# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
#
# For example, to use hib-dlagent to download files set something like this in
# your makepkg.conf (change/add -k and add -u/-p to your needs):
# DLAGENTS=('hib::/usr/bin/hib-dlagent -k 1a2b3c -o %o $(echo %u | cut -c 7-)')
#
# To auto-search through a directory containing Humble Bundle downloads, you
# could set:
# DLAGENTS=('hib::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; exit 1')


package()
{
	install -d "${pkgdir}/opt/${pkgname}/"

# Otherwise it extract the files loosely in ${srcdir}/
	tar -xzf  "${srcdir}/${_archivename}.tar.gz" -C "${pkgdir}/opt/${pkgname}/"

# We don't need these, as we use the shared system libraries
	rm -r "${pkgdir}/opt/${pkgname}/lib/.svn/"

	for i in "${_purgelibs[@]}"; do
		rm "${pkgdir}/opt/${pkgname}/lib/${i}"
	done
	rmdir "${pkgdir}/opt/${pkgname}/lib/" &> /dev/null || true

# The default owner/group is 500. I don't know if this is necessarry, but makepkg doesn't seem to set the owner/group of all files to root by default.
	chown -R root:root "${pkgdir}/opt/${pkgname}/"*

	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

# I extracted this from the windows executable; couldn't find one anywhere else
	install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	
# We need this as the program expect to be launched from the same directory it resides in
	install -d "${pkgdir}/usr/bin/"

	cat > "${pkgdir}/usr/bin/${pkgname}" <<-EOF
		#!/bin/bash

		cd "/opt/${pkgname}/"
		exec ./hotline_launcher
	EOF

	chmod 0755 "${pkgdir}/usr/bin/${pkgname}"
}
