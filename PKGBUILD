# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Matthias Lamers <aussieevil@hotmail.com>
pkgname=ohrrpgce
pkgver=wip.r13561
pkgrel=2
pkgdesc="A role playing game creation engine"
arch=(i686 x86_64)
license=(GPL)
url="http://rpg.hamsterrepublic.com/ohrrpgce/Main_Page"
depends=('sdl2_mixer' 'openeuphoria' 'libxpm' 'libxrandr' 'ncurses' 'xterm' 'libxinerama')
makedepends=('subversion' 'freebasic' 'scons')
optdepends=('timidity-freepats: midi music support')
source=(svn+https://rpg.hamsterrepublic.com/source/wip#revision=r13561)

pkgver(){
	cd "${srcdir}/wip"
	local ver="$(svnversion)"
	printf "%s.r%s" "wip" "${ver//[[:alpha:]]}"
}

prepare() {
	cd "${srcdir}/wip"
	#sed 's|env python|env python2|' -i reloadbasic/reloadbasic.py
	#sed 's|env python|env python2|' -i SConscript
	#sed 's|gcc_flags = \[\]|gcc_flags = ["-Wno-format"]|' -i SConscript
	sed 's/, HSPEAK\||//' -i SConscript
	#chmod +x reloadbasic/reloadbasic.py
  	#dos2unix -o *.rbas
  	#PATH=$PATH:/usr/share/openeuphoria/bin/
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "${srcdir}"
	mkdir -p release/usr/share/games/ohrrpgce
	cd "${srcdir}/wip"
	cat << EOF > hspeak
#!/bin/bash
/usr/share/openeuphoria/bin/eui /usr/share/games/ohrrpgce/hspeak.exw $*
EOF
	cp hspeak.exw "${srcdir}/release/usr/share/games/ohrrpgce"
	chmod a+x hspeak
	#cd ..
	if [ "$CARCH" = "x86_64" ]; then
		scons arch=64 game custom unlump relump release=1 install destdir='../release'
	else
		scons game custom unlump relump release=1 install destdir='../release'
	fi
	cd vikings
	"${srcdir}/release/usr/share/games/ohrrpgce/relump" vikings.rpgdir vikings.rpg
	rm -rf vikings.rpgdir
	cd ..
	mkdir "${srcdir}/release/usr/share/games/ohrrpgce/vikings"
	cp -r vikings/* "${srcdir}/release/usr/share/games/ohrrpgce/vikings"
	#scons arch=64 game custom hspeak unlump relump debug=0
}

package() {
	pwd
	cp -r ./release/* "$pkgdir/"
	#cd "$pkgname-$pkgver"
	#make DESTDIR="$pkgdir/" install
	#cd "${srcdir}/etheldreme"
	#cp -prv "${srcdir}/etheldreme/vikings/*" "${pkgdir}"
}
md5sums=('SKIP')
