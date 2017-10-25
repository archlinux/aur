# Maintainer: Matthias Lamers <aussieevil@hotmail.com>
pkgname=ohrrpgce
pkgver=dwimmercrafty+1.r9607
pkgrel=1
pkgdesc="A role playing game creation engine"
arch=(i686 x86_64)
license=(GPL)
url="http://rpg.hamsterrepublic.com/ohrrpgce/Main_Page"
depends=('sdl_mixer' 'openeuphoria' 'libxpm' 'libxrandr' 'ncurses' 'xterm')
makedepends=('subversion' 'freebasic' 'scons' 'openeuphoria' 'dos2unix')
optdepends=('timidity-freepats: midi music support')
source=(svn+https://rpg.hamsterrepublic.com/source/rel/dwimmercrafty)

pkgver(){
	cd "${srcdir}/dwimmercrafty"
	local ver="$(svnversion)"
	printf "%s.r%s" "dwimmercrafty+1" "${ver//[[:alpha:]]}"
}

prepare() {
	cd "${srcdir}/dwimmercrafty"
	sed 's|env python|env python2|' -i reloadbasic/reloadbasic.py
    sed 's|env python|env python2|' -i SConscript
	chmod +x reloadbasic/reloadbasic.py
  	dos2unix -o *.rbas
  	PATH=$PATH:/usr/share/openeuphoria/bin/
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "${srcdir}/dwimmercrafty"
	if [ "$CARCH" = "x86_64" ]; then
		scons arch=64 game custom hspeak unlump relump debug=0 install destdir='../release'
	else
		scons game custom hspeak unlump relump debug=0 install destdir='../release'
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
	#cd "${srcdir}/dwimmercrafty"
	#cp -prv "${srcdir}/dwimmercrafty/vikings/*" "${pkgdir}"
}
md5sums=('SKIP')
