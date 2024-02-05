pkgname=opentitus
pkgver=0.8.1
pkgrel=3
pkgdesc='Rewrite of the game engine used in the old DOS-based games Titus the Fox and Moktar (the French version)'
arch=(x86_64 aarch64)
url=https://opentitus.sourceforge.net/
license=(GPL3)
depends=(sdl_{mixer,image})
makedepends=(gcc9)
install=$pkgname.install
source=(
	https://download.sf.net/$pkgname/OpenTitus_${pkgver}_src.zip
	https://github.com/usineur/opentitus/raw/1f1c661392a71c734e5ee3916e2df5c3f9bef464/src/gates.c
	https://github.com/chocolate-doom/chocolate-doom/archive/refs/tags/chocolate-doom-2.0.0.tar.gz
	https://archive.org/download/Disk7/Disk7.iso
	usrlevel.7z	# http://ttf.mine.nu/cgi-bin/usrlevel.cgi, converted to SQZ with https://github.com/kaimitai/vtitus
	titus_usrlevel.diff
	$pkgname{.sh,{,-moktar,-usrlevel}.desktop}
	{titus,moktar,lagbonus}.png
	titusbig.webp	# https://www.artstation.com/artwork/ba3Olo
	lagafbig.webp)	# https://cpcrulez.fr/GamesTest/les_aventures_de_moktar.htm#DL, cutout with https://zyro.com/tools/image-background-remover
noextract=(Disk7.iso)
md5sums=(
	96d8226064c7f6072dadd25f1460b135
	68f094cbc2c6af90a88a2672127f26f8
	e8f6ce424e40308bdd5f8282856876fa
	4996178ebf01d3271520de05727e2b99
	SKIP{,,,,,,,,,,})
build(){
	mkdir -p Disk7
	bsdtar xf Disk7.iso -C Disk7
	cd OpenTitus_${pkgver}_src
	cp ../gates.c src
	cp ../chocolate-doom-chocolate-doom-2.0.0/opl/opl{.c,_{internal.h,queue.{c,h},sdl.c,timer.{c,h}}} opl
	sed -i 's,libopl_linux.a,dbopl_light.o opl/opl.o opl/opl_sdl.o opl/opl_queue.o,;1s,$, -I/usr/include/SDL,' Makefile_linux
	CC=gcc-9 make -f Makefile_linux
	sed -i /^videomode/s/0/1/ titus{,_moktar}.conf	# fullscreen by default
}
package(){
	install Disk7/FOX/{FONTS,LEVELD,MENU,SPREXP,TIT{RE,US}}.SQZ -Dt "$pkgdir"/usr/share/$pkgname/titus
	install {titus,moktar,lagbonus}.png -Dt "$pkgdir"/usr/share/icons/hicolor/32x32/apps
	install titusbig.webp -D "$pkgdir"/usr/share/icons/hicolor/512x512/apps/titus.png
	cp lagafbig.webp "$pkgdir"/usr/share/icons/hicolor/512x512/apps/moktar.png
	install $pkgname{,-moktar,-usrlevel}.desktop -Dt "$pkgdir"/usr/share/applications
	cd OpenTitus_${pkgver}_src
	install $pkgname ../$pkgname.sh -Dt "$pkgdir"/usr/bin
	cp -r titus{,_moktar.conf} moktar ../usrlevel "$pkgdir"/usr/share/$pkgname
	patch titus.conf ../titus_usrlevel.diff -o "$pkgdir"/usr/share/$pkgname/titus_usrlevel.conf
	cp {,"$pkgdir"/usr/share/$pkgname/titus_}titus.conf
	install flags/bordered_18x12/00_cctld/{no,il,nl}.png -Dt "$pkgdir"/usr/share/$pkgname/flags/bordered_18x12/00_cctld
	install -D {,"$pkgdir"/usr/share/doc/$pkgname/}flags/readme.txt
	cp -r doc {Changelog,readme{,_linux}}.txt "$pkgdir"/usr/share/doc/$pkgname
}
