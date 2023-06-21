# Maintainer: matrix <thysupremematrix attttttt tuta dotttt io>
# Portions of this PKGBUILD (particularly the .desktop file and parts of the package() function) have been taken from the package uplink and uplink-hib

pkgname=uplink-gog
_pkgname=uplink
pkgver=1.6_gog_4 # See https://www.gog.com/en/account
_sh_pkgver=2.0.0.4
pkgrel=2
pkgdesc="GOG version of Uplink"
arch=("i686" "x86_64")
url="https://www.gog.com/game/uplink_hacker_elite"
license=("custom:EULA")
groups=("games")
source=("gog_uplink_hacker_elite_${_sh_pkgver}.sh::gogdownloader://uplink_hacker_elite/en3installer1" "uplink.desktop")
sha256sums=('275fafa60e9a12b83d7ab005afbd0a2fc3146d749c8cbd021e4beb728597d8d1'
            '87a4d1d312e73dbd4b8bb746a798c098c4dbfe77b8b6e0c6f1b10be3ebc60d22')
depends=('mesa' 'libjpeg6-turbo' 'sdl_mixer' 'freetype2')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"${pwd}\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

if [ "$CARCH" = "x86_64" ]; then
  _libi='lib64'
  _aarchi='x86_64'
else
  _libi='lib'
  _aarchi='x86'
fi


package() {
	cd "${srcdir}/data/noarch/game"
	install -d "${pkgdir}/opt"
	cp -r . "${pkgdir}/opt/${_pkgname}"
	
	# Use system-provided libraries where possible. Use provided mikmod since the
	# system so version is too new. Use provided SDL_mixer since it crashes with
	# newer versions.
	rm "${pkgdir}/opt/${_pkgname}/${_libi}/libjpeg.so.62"
	rm "${pkgdir}/opt/${_pkgname}/${_libi}/libjpeg.so.62.0.0"
	rm "${pkgdir}/opt/${_pkgname}/${_libi}/libSDL-1.2.so.0"
	rm "${pkgdir}/opt/${_pkgname}/${_libi}/libSDL-1.2.so.0.11.3"
	
	# Fix permissions
	chmod -R 644 "${pkgdir}/opt/${_pkgname}"
	chmod +x "${pkgdir}/opt/${_pkgname}/${_libi}"
	chmod +x "${pkgdir}/opt/${_pkgname}"
	chmod +x "${pkgdir}/opt/${_pkgname}/uplink.bin.${_aarchi}"
	
	# Install licences
	install -Dm644 "${srcdir}/data/noarch/game/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-one.txt"
	install -Dm644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-two.txt"
	
	# Install documentation
	install -Dm644 "${srcdir}/data/noarch/docs/installer_readme.txt" "$pkgdir/usr/share/doc/$pkgname/README-one.txt"
	install -Dm644 "${srcdir}/data/noarch/support/support_notice.txt" "$pkgdir/usr/share/doc/$pkgname/support-notice.txt"
	install -Dm644 "${srcdir}/data/noarch/gameinfo" "$pkgdir/usr/share/doc/$pkgname/GAMEINFO.txt"
	install -Dm644 "${srcdir}/data/noarch/game/changes.txt" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.txt"
	install -Dm644 "${srcdir}/data/noarch/game/readme.txt" "$pkgdir/usr/share/doc/$pkgname/README-two.txt"
	install -Dm644 "${srcdir}/data/noarch/game/mods.txt" "$pkgdir/usr/share/doc/$pkgname/MODS.txt"
	
	# Link executable
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/uplink.bin.${_aarchi}" "${pkgdir}/usr/bin/${_pkgname}"
	
	# Install icon
	install -d "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${srcdir}/data/noarch/game/uplink.png" "${pkgdir}/usr/share/pixmaps/uplink.png"
	
	# Install .desktop file
	install -Dm644 "${srcdir}/uplink.desktop" "${pkgdir}/usr/share/applications/uplink.desktop"
}

