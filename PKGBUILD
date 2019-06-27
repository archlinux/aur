# Maintainer: Rafael Cruz <rafaelcruz at outlook dot com>

pkgname=fightcade2
pkgver=2.0.12
pkgrel=4
pkgdesc='The best way to play your favorite retro games with or against any other player in the world.'
url='https://play.fightcade.com/'
arch=('any')
license=('custom')
depends=(wine lib32-mpg123)
makedepends=(gendesk sed rsync)
source=(https://play.fightcade.com/download/fightcade2-linux64-v2.0.12.tar.gz)
md5sums=('8efa181b26a01b5d2b633d9e3146cd69')

_changelogpath="/log =\|fbaini =\|fbainidef =\|sn9xconf =\|sn9xconfdef =/ s|os.path.abspath(os.path.dirname(sys.argv\[0\]))|\"${HOME}/.fightcade2/\"|g"
_addupdateoption="s|if platform.system()==|if 'updateonly' not in sys.argv and platform.system()==|g"

prepare() {
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Fightcade 2" --exec "/opt/$pkgname/Fightcade2"
	# sed -i '/if \[ -f update.log/d' $srcdir/Fightcade2/Fightcade2
	sed -i "$_addupdateoption" $srcdir/Fightcade2/Fightcade2.py
	cd $srcdir/Fightcade2
	msg "Updating emulator and savestates..."
	python2 Fightcade2.py updateonly
	msg "Changing log and config paths..."
	sed -i "$_changelogpath" $srcdir/Fightcade2/Fightcade2.py
	sed -i "$_changelogpath" $srcdir/Fightcade2/emulator/fcade.py
	sed -i "$_addupdateoption" $srcdir/Fightcade2/Fightcade2.py
}

package() {
	install -dm755 $HOME/.$pkgname/
	install -dm755 $pkgdir/opt/
	install -Dm644 "$srcdir/Fightcade2/fc2-electron/resources/app/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	msg "Copying files..."
	rsync -r --chmod=755 $srcdir/Fightcade2/* $pkgdir/opt/$pkgname/
	msg "Changing emulators configs permissions..."
	chmod 777 "$pkgdir/opt/$pkgname/emulator/snes9x/fcadesnes9x.conf"
	chown -R $USER $pkgdir/opt/$pkgname/emulator/fba/config/
}
