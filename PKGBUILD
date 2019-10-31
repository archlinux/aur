# Maintainer: Rafael Cruz <rafaelcruz at outlook dot com>

pkgname=fightcade-windows
pkgver=1
pkgrel=2
pkgdesc='An online arcade gaming platform for netplay based on GGPO. (Full Windows-wine version)'
url='http://www.fightcade.com/'
arch=('any')
license=('custom')
depends=(wine lib32-mpg123)
makedepends=(gendesk rsync icoutils)
source=($pkgname.zip::http://www.fightcade.com/download/fightcade-win32-v042.2.zip)
md5sums=('SKIP')
_tmpappfolder="FightCade"
_execapp="FightCade.exe"
_wineprefix="prefix"

prepare() {
    msg "Generating icon..."
    wrestool -x --output="$srcdir/icon.png" -t14 -n0 "$srcdir/$_tmpappfolder/${_execapp}"
    msg "Generating menu shortcut..."
	#/bin/bash -c 'cd /opt/fightcade-windows && wine FightCade.exe'
    gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Fightcade" --exec "env WINEPREFIX=\"$HOME/.$pkgname/$_wineprefix\" /bin/bash -c 'cd \"/opt/$pkgname/\" && wine $_execapp'"
}

package() {
    install -dm755 $HOME/.$pkgname/
	install -dm755 $pkgdir/opt/
	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	msg "Copying files..."
	rsync -r --chmod=755 $srcdir/$_tmpappfolder/* $pkgdir/opt/$pkgname/
	chown -R $USER:users $pkgdir/opt/$pkgname/
}
