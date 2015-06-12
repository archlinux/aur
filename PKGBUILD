# Maintainer: Philip Abernethy <chais.z3r0@gmail.com>

pkgname=dustaet-hib
pkgver=01082014
pkgrel=2
pkgdesc="Dust: An Elysian Tail. An action packed 2D, hack'n'slay platformer"
arch=('i686' 'x86_64')
url="http://www.noogy.com/main.html"
license=('custom:commercial')
makedepends=('imagemagick')
#depends=('libogg' 'openal' 'sdl2' 'sdl2_mixer' 'libtheora' 'libvorbis')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_gamepkg="dustaet-${pkgver}-bin"

source=("hib://$_gamepkg")

sha512sums=('e79f9e67256640e2587ba738d4213c7763c63f8084ae1046f1604c674cc396b8f4183b6d890a540d979dead899bbf1ec5016dce4729bfbb4876d9dec92cbc1ae')

PKGEXT='.pkg.tar'

package() {
	install -dm755 "${pkgdir}"/opt/dustaet
	install -dm755 "${pkgdir}"/usr/{bin,share/applications}
	cd "${srcdir}"/data
	find {Content,data,de,es,fr,it,ja,mono} -type d -exec install -dm755 "${pkgdir}"/opt/dustaet/{} \;
	find {Content,data,de,es,fr,it,ja,mono} -type f -exec install -m644 {} "${pkgdir}"/opt/dustaet/{} \;
	find -type f -name '*.dll*' -exec install -m644 {} "${pkgdir}"/opt/dustaet/{} \;
	if [ $CARCH=="x86_64" ]; then
		find lib64 -type d -exec install -dm755 "${pkgdir}"/opt/dustaet/{} \;
		find lib64 -type f -exec install -m644 {} "${pkgdir}"/opt/dustaet/{} \;
		install -m755 DustAET.bin.x86_64 "${pkgdir}"/opt/dustaet/DustAET.bin.x86_64
	else
		find lib -type d -exec install -dm755 "${pkgdir}"/opt/dustaet/{} \;
		find lib -type f -exec install -m644 {} "${pkgdir}"/opt/dustaet/{} \;
		install -m755 DustAET.bin.x86 "${pkgdir}"/opt/dustaet/DustAET.bin.x86
	fi
	install -m755 DustAET.exe "${pkgdir}"/opt/dustaet/DustAET.exe
	install -m644 "Dust An Elysian Tail.bmp" "${pkgdir}/opt/dustaet/Dust An Elysian Tail.bmp"
	mogrify -format png "Dust An Elysian Tail.bmp"
	install -Dm644 "Dust An Elysian Tail.png" "${pkgdir}"/usr/share/pixmaps/dustaet.png
	echo "#!/bin/bash
cd /opt/dustaet/
ARCH=\$(uname -m)
if [ \"\$ARCH\" == \"x86_64\" ]; then
	./DustAET.bin.x86_64
else
	./DustAET.bin.x86
fi" > $pkgdir/usr/bin/dustaet
	chmod 755 "${pkgdir}"/usr/bin/dustaet
	echo "[Desktop Entry]
Type=Application
Name=Dust: An Elysian Tale
GenericName=Dust: An Elysian Tale
Comment=${pkgdesc}
Icon=dustaet
Exec=/usr/bin/dustaet
Categories=Games;
Path=/opt/dustaet" > "${pkgdir}"/usr/share/applications/dustaet.desktop
	chmod 644 "${pkgdir}"/usr/share/applications/dustaet.desktop
}
