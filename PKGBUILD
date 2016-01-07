pkgname=heretic
pkgver=1.0
pkgrel=1
pkgdesc="Heretic 3D shooter game"
arch=(any)
url="http://oldgames.ru"
license=('custom')
depends=(dosbox bash)
makedepends=(unrar)
noextract=('heretic.rar')
source=('http://oldgames.ru/oldgames/files/H/heretic.rar')
md5sums=('9e3ff522a3db4704cfc2bcd5ddc15b06')

package() {
  cd "$srcdir/"
  unrar x 'heretic.rar'

  local game=heretic

  mkdir -p $pkgdir/usr/share/ $pkgdir/usr/bin/
  cp -r HERETIC $pkgdir/usr/share/$game

  cat >$pkgdir/usr/bin/$game <<EOF
#!/bin/sh

if [ ! -d ~/.dosbox/$game ]; then
	mkdir -p ~/.dosbox/$game
	cd ~/.dosbox/$game
	ls -1 /usr/share/$game | while read A; do
		ln -s /usr/share/$game/\$A \$A
	done

	rm -f HERETIC.CFG MODEM.CFG
	cp /usr/share/$game/HERETIC.CFG /usr/share/$game/MODEM.CFG ./
fi
cd ~/.dosbox/$game
dosbox -c 'mount c ~/.dosbox/$game' -c 'c:' -c '$game' -c 'exit'
EOF

  chmod 0755 $pkgdir/usr/bin/$game
}

