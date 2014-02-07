# Maintainer: J0k3r <moebius282 e4at gmail D0_T com>

pkgname=hotlinemiami
pkgver=1.0.9a
pkgrel=2
pkgdesc="A 2D top-down action video game"
url="http://hotlinemiami.com/"
license=('unknown')
# © Dennaton Interactive Design of the Future ™
arch=('i686' 'x86_64')
groups=("games")
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-openal' 'lib32-libvorbis' 'lib32-nvidia-cg-toolkit' 'lib32-glu' 'lib32-fontconfig' 'lib32-libxrandr')
else
	depends=('openal' 'libvorbis' 'nvidia-cg-toolkit' 'glu' 'fontconfig' 'lib32-xrandr' 'libxrandr' 'qt5-base' )
fi
_archivename="${pkgname}_v${pkgver}-Linux_28-05-2013"
source=("hib://${_archivename}.tar.gz"
		"${pkgname}.desktop"
		"${pkgname}.png")
sha256sums=('070300558ba52f75455d1645bba6dd956f460ada0d3839f8b3c3ac712ba957da'
			'ca65c11bc9e06f438b2da2bb44c40424537e60b704656a155f672b16fde5f8de'
			'01432c725bd258761e67fe1db94531465ba0480e250724cf6b939669e13b0e8a')
noextract=("${source[0]:6}")
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

# Otherwise it extract the files loosely in $srcdir
	tar -xzf  "${srcdir}/${_archivename}.tar.gz" -C "${pkgdir}/opt/${pkgname}/"

# We don't need these, as we use the shared system libraries
# We can't go this simple way on x86_64 currently, as arch doesn't provide lib32-qt5 :(
	if [ "$CARCH" = "x86_64" ]; then
		_purgelibs=('libopenal.so.1' 'libCgGL.so' 'libCg.so')
		for i in "${_purgelibs[@]}"; do
			rm "${pkgdir}/opt/${pkgname}/lib/${i}"
		done
		chown root:root "${pkgdir}/opt/${pkgname}/lib/"
	else
		rm -r "${pkgdir}/opt/${pkgname}/lib/"
	fi

	find "${pkgdir}/opt/${pkgname}/" -type f -exec chown root:root "{}" \;

	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
# I extracted this from the windows executable; couldn't find one anywhere else
	install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	
	install -d "${pkgdir}/usr/bin/"

# We need this as the program expect to be launched from the same directory it resides in
	cat > "${pkgdir}/usr/bin/${pkgname}" <<-EOF
		#!/bin/bash

		cd "/opt/${pkgname}/"
		exec ./hotline_launcher
	EOF

	chmod 0755 "${pkgdir}/usr/bin/${pkgname}"
}