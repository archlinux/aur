pkgname=hmm
pkgver=1.0
pkgrel=1
pkgdesc="Heroes of might and magick"
arch=(any)
url="http://www.nival.com"
license=('custom')
depends=(dosbox bash)
makedepends=(unrar)
noextract=('HeroesM&M.rar')
source=('http://oldgames.ru/oldgames/files/H/HeroesM&M.rar')
md5sums=('61adc0338ba02db2ce04db4f6cd9ee7d')

package() {
  cd "$srcdir/"
  unrar x 'HeroesM&M.rar'
  mkdir -p $pkgdir/usr/share/ $pkgdir/usr/bin/
  cp -r HMM1 $pkgdir/usr/share/heroes1
  cat >$pkgdir/usr/bin/heroes1 <<EOF
#!/bin/sh

if [ ! -d ~/.dosbox/heroes1 ]; then
	mkdir -p ~/.dosbox/heroes1
	cd ~/.dosbox/heroes1

	ls -1 /usr/share/heroes1 | while read A; do
		ln -s /usr/share/heroes1/\$A \$A
	done

	rm -f GAMES HEROES.CFG DATA
	mkdir GAMES DATA
	cp /usr/share/heroes1/HEROES.CFG .


	ls -1 /usr/share/heroes1/DATA | while read A; do
		ln -s /usr/share/heroes1/DATA/\$A DATA/\$A
	done

	rm -f DATA/STANDARD.HS
	cp /usr/share/heroes1/DATA/STANDARD.HS DATA/
fi
cd ~/.dosbox/heroes1
dosbox -c 'mount c ~/.dosbox/heroes1' -c 'mount d /tmp -t cdrom -usecd 0 -ioctl' -c 'c:' -c 'HEROES' -c 'exit'
EOF
  chmod 0755 $pkgdir/usr/bin/heroes1
}
