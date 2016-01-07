pkgname=hmm2
pkgver=1.0
pkgrel=1
pkgdesc="Heroes of might and magick II"
arch=(any)
url="http://www.nival.com"
license=('custom')
depends=(dosbox bash)
makedepends=(unrar)
noextract=('HeroesM&M2_PoL.rar')
source=('http://oldgames.ru/oldgames/files/H/HeroesM&M2_PoL.rar')
md5sums=('2345816e5781574f7ff0bc25f71ba96a')

package() {
  cd "$srcdir/"
  unrar x 'HeroesM&M2_PoL.rar'
  mkdir -p $pkgdir/usr/share/ $pkgdir/usr/bin/
  cp -r HEROES2 $pkgdir/usr/share/heroes2
  cat >$pkgdir/usr/bin/heroes2 <<EOF
#!/bin/sh

if [ ! -d ~/.dosbox/heroes2 ]; then
	mkdir -p ~/.dosbox/heroes2
	cd ~/.dosbox/heroes2

	ls -1 /usr/share/heroes2 | while read A; do
		ln -s /usr/share/heroes2/\$A \$A
	done

	rm -f GAMES HEROES2.CFG DATA
	mkdir GAMES DATA
	cp /usr/share/heroes2/HEROES2.CFG .


	ls -1 /usr/share/heroes2/DATA | while read A; do
		ln -s /usr/share/heroes2/DATA/\$A DATA/\$A
	done

	rm -f DATA/STANDARD.HS
	cp /usr/share/heroes2/DATA/STANDARD.HS DATA/
fi
cd ~/.dosbox/heroes2
dosbox -c 'mount c ~/.dosbox/heroes2' -c 'c:' -c 'heroes2' -c 'exit'
EOF
  chmod 0755 $pkgdir/usr/bin/heroes2
}
