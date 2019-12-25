# Maintainer: Rafael Cruz <rafaelcruz at outlook dot com>

pkgname=yzkof-gm-arcade-international
pkgver=0.91
pkgrel=1
pkgdesc='Play retro games with or against any other player in the world.'
url='http://www.yzkof.com/'
arch=('any')
license=('custom')
depends=(wine lib32-mpg123)
makedepends=(gendesk rsync icoutils)
source=($pkgname.zip::https://xiaou-game.oss-cn-hangzhou.aliyuncs.com/GM%20ARCADE_V09.zip)
md5sums=('SKIP')
_tmpappfolder="GM ARCADE_V0.9"
_oldexecapp="GM ARCADE.exe"
_execapp="gm-arcade.exe"
_wineprefix="prefix"

prepare() {
    msg "Preparing files..."
    [ -f "$srcdir/$_tmpappfolder/$_execapp" ] && [ -f "$srcdir/$_tmpappfolder/$_oldexecapp" ] && rm "$srcdir/$_tmpappfolder/$_execapp"
    # [ -f "$srcdir/$_tmpappfolder/$_oldexecapp" ] && mv "$srcdir/$_tmpappfolder/$_oldexecapp" "$srcdir/$_tmpappfolder/$_execapp"
    msg "Generating icon..."
    wrestool -x --output="$srcdir/icon.png" -t14 "$srcdir/$_tmpappfolder/${_oldexecapp}"
    msg "Generating menu shortcut..."
    gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name "Yzkof GM Arcade International" --exec "env WINEPREFIX=\"$HOME/.$pkgname/$_wineprefix\" wine \"/opt/$pkgname/$_oldexecapp\""
}

package() {
    install -dm755 $HOME/.$pkgname/
	install -dm755 $pkgdir/opt/
	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	msg "Copying files..."
    #dont use variable below, bug on copy files
	rsync -r --chmod=755 $srcdir/GM\ ARCADE_V0.9/* $pkgdir/opt/$pkgname/
	chown -R $USER:users $pkgdir/opt/$pkgname/
}
