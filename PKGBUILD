pkgname=dune2
pkgver=1.0
pkgrel=3
pkgdesc="Dune 2 strategy game"
arch=(any)
url="http://oldgames.ru"
license=('custom')
depends=(dosbox bash)
makedepends=(unrar)
noextract=('Dune_2.rar' 'Dune_2_RUS.rar')
source=('http://oldgames.ru/oldgames/files/D/Dune_2.rar'
	'http://oldgames.ru/oldgames/files/D/Dune_2_RUS.rar')
md5sums=('39ea7c054108b52e3897783e174c7441'
         '544e947f73df714e7c514567c19d9023')

package() {
  cd "$srcdir/"
  unrar x 'Dune_2.rar'
  unrar x -ad 'Dune_2_RUS.rar'

  local game=dune2

  mkdir -p $pkgdir/usr/share/ $pkgdir/usr/bin/
  cp -r "DUNE2" $pkgdir/usr/share/$game
  cp -r "Dune_2_RUS" $pkgdir/usr/share/$game-ru

  cat >$pkgdir/usr/bin/$game-ru <<EOF
#!/bin/sh

if [ ! -d ~/.dosbox/$game-ru ]; then
	mkdir -p ~/.dosbox/$game-ru
	cd ~/.dosbox/$game-ru
	ls -1 /usr/share/$game-ru | while read A; do
		ln -s /usr/share/$game-ru/\$A \$A
	done

	rm -f DUNE.CFG SAVEFAME.DAT OPTIONS.CFG
	cp /usr/share/$game-ru/DUNE.CFG /usr/share/$game-ru/SAVEFAME.DAT /usr/share/$game-ru/OPTIONS.CFG ./
fi
cd ~/.dosbox/$game-ru
dosbox -c 'mount c ~/.dosbox/$game-ru' -c 'c:' -c '$game' -c 'exit'
EOF

  cat >$pkgdir/usr/bin/$game <<EOF
#!/bin/sh

if [ ! -d ~/.dosbox/$game ]; then
	mkdir -p ~/.dosbox/$game
	cd ~/.dosbox/$game
	ls -1 /usr/share/$game | while read A; do
		ln -s /usr/share/$game/\$A \$A
	done

	rm -f DUNE.CFG SAVEFAME.DAT OPTIONS.CFG
	cp /usr/share/$game/DUNE.CFG /usr/share/$game/SAVEFAME.DAT /usr/share/$game/OPTIONS.CFG ./
fi
cd ~/.dosbox/$game
dosbox -c 'mount c ~/.dosbox/$game' -c 'c:' -c '$game' -c 'exit'
EOF

  chmod 0755 $pkgdir/usr/bin/$game*
}

