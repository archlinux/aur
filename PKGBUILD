# Maintainer: J0k3r <moebius282 e4at gmail D0_T com>

pkgname=littleinferno
pkgver=20130509
pkgrel=1
pkgdesc="A game about burning things"
url="http://tomorrowcorporation.com/littleinferno"
license=('custom:proprietary')
arch=('i686' 'x86_64')
groups=("games")
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-openal' 'lib32-libvorbis' 'lib32-curl' 'lib32-libgl')
else
	depends=('openal' 'libvorbis' 'curl' 'libgl')
fi
_archivename="LittleInferno-${pkgver}"
source=("hib://${_archivename}.sh"
		"${pkgname}.desktop")
sha256sums=('3848f4037652699c162ebf3ae78f6dce81772394911483c9f1ef49cb51f6a198'
            '32a630a295a136552f748156ba981154d04d1695d8f8dab316928c40a55d6a95')
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
# Extract double packed game files
	msg 'Extracting archive...'

	install -d "${srcdir}/${pkgname}/"
	sh "${_archivename}.sh" --tar -xf -C "${srcdir}/${pkgname}"

	cd "${srcdir}/${pkgname}/"

# Using provided license
	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	tar --lzma --strip-components 1 -xf "./subarch" -C "${pkgdir}/usr/share/licenses/${pkgname}/" config/license

# Extracting the game-files
	install -d "${pkgdir}/opt/${pkgname}/"
	tar --lzma -xf "./instarchive_all" -C "${pkgdir}/opt/${pkgname}/"
# We don't extract the bundled libraries as we use the shared ones
	tar --lzma -xf "./instarchive_linux_all" -C "${pkgdir}/opt/${pkgname}/" LittleInferno.bin.x86

	find "${pkgdir}/opt/${pkgname}/" -type f -exec chown root:root "{}" \;
	find "${pkgdir}/opt/${pkgname}/" -type f -exec chmod 0644 "{}" \;
	chown root:root "${pkgdir}/usr/share/licenses/${pkgname}/license"
	chmod 0755 "${pkgdir}/usr/share/licenses/${pkgname}/license"
	chmod 0755 "${pkgdir}/opt/${pkgname}/LittleInferno.bin.x86"

	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${pkgdir}/opt/${pkgname}/LittleInferno.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	
	install -d "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname}/LittleInferno.bin.x86" "${pkgdir}/usr/bin/${pkgname}"
}