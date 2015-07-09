# Maintainer: Marek Otahal <markotahal gmail>
# Contributor: C5OK5Y 
# Contributor: N30N <archlinux@alunamation.com>

pkgname=osmos
pkgver=1.6.1
pkgrel=3
pkgdesc="Enter the ambient world of Osmos: elegant, physics-based gameplay, dreamlike visuals, and a minimalist, electronic soundtrack."
arch=("i686" "x86_64")
url="http://www.hemispheregames.com/osmos/"
license=("custom: commercial")
depends=("glu" "freetype2" "libvorbis" "openal")
source=("hib://Osmos_${pkgver}.tar.gz" "osmos.desktop")
md5sums=("ed2cb029c20c25de719c28062e6fc9cf"
         "7709be11fab3001b109ddf842b596d0c")
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
build() {
	cd $srcdir

	msg2 "Patching install path."
	sed -ri "s|^(CANONPATH=).*|\1/opt/osmos/Osmos|" Osmos/Osmos

	msg2 "Patching sound issue."
	sed -ri 's/^(soundDevice ")-/\1/' Osmos/defaults.cfg
}

package() {
	cd Osmos

	install -d "${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/applications" \
		"${pkgdir}/usr/share/licenses/${pkgname}" \
		"${pkgdir}/opt/osmos/Fonts" \
		"${pkgdir}/opt/osmos/Icons" \
		"${pkgdir}/opt/osmos/Sounds" \
		"${pkgdir}/opt/osmos/Textures"

	if [ ${CARCH} == "x86_64" ]; then
		install -m755 Osmos.bin64 "$pkgdir/opt/osmos"
	else
		install -m755 Osmos.bin32 "$pkgdir/opt/osmos"
	fi

	install -m755 Osmos "$pkgdir/usr/bin/osmos"
	install -m644 *.{cfg,loc} "${pkgdir}/opt/osmos"
	install -m644 Icons/*.png "${pkgdir}/opt/osmos/Icons"
	install -m644 Sounds/*.ogg "${pkgdir}/opt/osmos/Sounds"
	install -m644 Textures/*.tga "${pkgdir}/opt/osmos/Textures"
	install -m644 Fonts/*.ttf "${pkgdir}/opt/osmos/Fonts"
	install -m644 eula.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 "${srcdir}/osmos.desktop" \
		"${pkgdir}/usr/share/applications/osmos.desktop"
}

# vim: set noet ff=unix:
