# Maintainer: P. Neidhardt <ambrevar at gmail dot com>

pkgname=streetsofrageremake
pkgver=5.1
pkgrel=2
pkgdesc="A remake of the classic Streets of Rage 1, 2 and 3 by Sega"
arch=('i686' 'x86_64')
url="http://sorr.forumotion.net/t148-sor-v5-for-linux-debian-download-links"
license=('custom')
if [ "$CARCH" = "i686" ]; then
	depends=('alsa-lib' 'libpng12' 'sdl_mixer' 'smpeg' 'zlib')
else
	depends=('lib32-alsa-lib' 'lib32-libpng12' 'lib32-sdl_mixer' 'lib32-smpeg' 'lib32-zlib')
fi
install="sorr.install"
source=(
	'http://www.soronline.net/downloads/sorr_5.0.orig.tar.gz'
	'http://www.soronline.net/downloads/SORRv051_REV030.zip'
	'Readme.linux'
	'sorr-wrapper'
	'renamelower'
	'renamelowerrec')
options=(!strip)
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u --referer http://www.soronline.net')
sha1sums=('5c719296ab1cbc222897fba00453a18e495ee8c4'
          '35323ee18ef7f010934501f3eae038710959399e'
          '37e4ce2bfbf9b593d0c9a62c3dfada1b3190a123'
          'f53dc4b099a5c70020596327e3a572ad0812e34a'
          '545d34c1885b172afebad77349493025071a87ed'
          '968775da5d7d296040b53efa4e822270efa460c6')

build() {
	cd "${srcdir}/"

	## We replace the broken launcher with a wrapper that will start the game
	## from $HOME/.sorr so that savegames and mods can be loaded from there.
	cp -f sorr-wrapper sorr
}

package() {
	cd "${srcdir}/"
	install -d "${pkgdir}/opt/sorr"

	## Data
	install -m755 "bgdc" "bgdi" "sorr" "${pkgdir}/opt/sorr"
	install -m644 "Manual.html" "Readme.txt" "SorMaker.dat" "SorR.dat" "${pkgdir}/opt/sorr"
	cp -r manual mod palettes data "${pkgdir}/opt/sorr/"

	## Remove junk files
	rm "${pkgdir}/opt/sorr/manual/img/Thumbs.db"

	## Libraries needed by the bennugd engine.
	## WARNING: this is the most sensible part. The choice of these library may
	## highly depend upon the target operating system.
	install -m644 "bennugd/libbgdrtm.so" "bennugd/libcrypto.so.1.0.0" "bennugd/libdraw.so" \
		"${pkgdir}/opt/sorr/data/"

	## For some strange reasons, all files are marked as executable. Let's clean
	## this up.
	(cd "${pkgdir}/opt/sorr/" && find data manual mod palettes -type f -exec chmod a-x {} \;)

	## Launcher
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/sorr/sorr" "${pkgdir}/usr/bin/sorr"

	## .desktop
	install -d "${pkgdir}/usr/share/applications/"
	install -m644 "sorr.desktop" "${pkgdir}/usr/share/applications/"

	## Icon
	install -m644 "sorr.png" "${pkgdir}/opt/sorr/"
	install -d "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
	ln -s "/opt/sorr/sorr.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"

	## Extra files
	install -m644 "Readme.linux" "${pkgdir}/opt/sorr"

	## Utils to make mods compatible
	install -m755 "renamelower" "${pkgdir}/usr/bin"
	install -m755 "renamelowerrec" "${pkgdir}/usr/bin"
}
